FROM alpine as builder
WORKDIR /gentoo
RUN echo -e "Building x32 ABI gentoo(amd64)\n"&&wget http://mirrors.ustc.edu.cn/gentoo/releases/amd64/autobuilds/current-stage3-amd64/stage3-x32-20200701T214503Z.tar.xz && tar -xpv  --numeric-owner -f stage3*&& rm stage3*
FROM scratch
COPY --from=builder /gentoo/ /
CMD ["/bin/bash"]
