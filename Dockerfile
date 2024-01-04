FROM postgres:16.1

# Time Zone
ENV TZ Asia/Tokyo

# Language
# RUN echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen
# ENV LANG ja_JP.UTF-8
# ENV LANGUAGE ja_JP:ja

RUN echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en