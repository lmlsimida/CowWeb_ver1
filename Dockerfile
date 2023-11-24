# define an alias for the specfic python version used in this file.
FROM python:3.10

# 设置容器的时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Requirements are installed here to ensure they will be cached.
COPY requirements.txt .
RUN pip install -r /requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install uwsgi -i https://pypi.tuna.tsinghua.edu.cn/simple

# Use /app folder as a directory where the source code is stored.
WORKDIR /app
# 指定uWSGI配置文件
COPY uwsgi.ini /etc/uwsgi/

# 暴露端口
EXPOSE 8000
RUN chmod 777 /tmp
# 复制应用到容器中
COPY . /app
# 复制 entrypoint 脚本并设置为可执行
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 设置启动脚本作为入口点
ENTRYPOINT ["/entrypoint.sh"]
# 使用启动脚本作为CMD
#CMD ["uwsgi", "--ini", "/etc/uwsgi/uwsgi.ini"]