import pandas as pd
from django.conf import settings
from django.db import transaction
from rich.progress import track

from apps.WebCloud.models import Cage, RFID, Calf, CalfCage, RFIDCage


def run():
    # 指定列的类型
    dtype_dict = {"笼号": str, "RFID": str, "牛号": str, "出生体重": float, "公母": str}
    df = pd.read_excel(
        settings.BASE_DIR / "康盛牧业犊牛饲喂统计表.xlsx",
        engine="openpyxl",
        skiprows=2,
        dtype=dtype_dict,
        parse_dates=["出生日期"],
    )
    # 找出 '笼号' 中的重复值
    calf_duplicates = df[df["牛号"].duplicated(keep=False) & df["牛号"].notna()][
        "牛号"
    ].unique()
    cage_duplicates = df[df["笼号"].duplicated(keep=False) & df["笼号"].notna()][
        "笼号"
    ].unique()
    rfid_duplicates = df[df["RFID"].duplicated(keep=False) & df["RFID"].notna()][
        "RFID"
    ].unique()
    with transaction.atomic():
        for _, row in track(df.iterrows(), total=len(df)):
            cage_id = row["笼号"]
            if pd.isna(cage_id):
                continue
            cage = Cage.objects.filter(cage_id=row["笼号"], pasture_id=1).first()
            if not cage:
                cage = Cage.objects.create(cage_id=row["笼号"], pasture_id=1)
            rfid = RFID.objects.filter(rfid_id=row["RFID"], pasture_id=1).first()
            if not rfid:
                rfid = RFID.objects.create(rfid_id=row["RFID"], pasture_id=1)
            if not rfid.is_bound:
                RFIDCage.bound(rfid, cage)
            calf_id = row["牛号"]
            if pd.isna(calf_id):
                continue

            sex = 1 if row["公母"] == "公" else 2
            calf = Calf.objects.filter(calf_id=calf_id).first()
            if not calf:
                calf = Calf.objects.create(
                    calf_id=calf_id,
                    sex=sex,
                    birth_weight=row["出生体重"],
                    date_of_birth=row["出生日期"],
                    pasture_id=1,
                )
                if calf_id not in calf_duplicates:
                    if not calf.is_in_cage:
                        calf.enter_cage(cage)
