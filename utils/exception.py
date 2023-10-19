from rest_framework import status
from rest_framework.views import Response
from rest_framework.views import exception_handler as drf_exception_handler


def exception_handler(exc, context):
    """
    自定义处理异常函数
    :param exc:
    :param context:
    :return:
    """
    response = drf_exception_handler(exc, context)
    if response is None:  # 处理之后为空，再进行自定义的二次处理
        # print(exc)      # 错误原因   还可以做更详细的原因，通过判断exc信息类型
        # print(context)  # 错误信息
        print("%s - %s - %s" % (context["view"], context["request"].method, exc))
        return Response(
            {"detail": "服务器错误"},
            status=status.HTTP_500_INTERNAL_SERVER_ERROR,
            exception=True,
        )
    return response  # 处理之后有值，就直接返回结果
