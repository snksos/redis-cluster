# 基础镜像
FROM redis:5.0.4
# 修复时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
# 环境变量
ENV REDIS_PORT 16380
# 暴露变量
EXPOSE $REDIS_PORT
# 复制
COPY entrypoint.sh /usr/local/bin/
COPY redis.conf /usr/local/etc/
# for config rewrite
RUN chmod 777 /usr/local/etc/redis.conf
RUN chmod +x /usr/local/bin/entrypoint.sh
# 入口
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
# 命令
CMD ["redis-server", "/usr/local/etc/redis.conf"]

