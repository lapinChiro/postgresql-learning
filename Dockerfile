FROM postgres:16.1

# Time Zone
ENV TZ Asia/Tokyo

# Language
RUN echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen && locale-gen
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
# ENV LC_ALL ja_JP.UTF-8