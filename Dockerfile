FROM jekyll/builder

LABEL version="0.1.0"
LABEL repository="https://github.com/root-project/jekyll-action"
LABEL homepage="https://github.com/root-project/jekyll-action"
LABEL maintainer="ROOT devs <rootdev@cern.ch>"

LABEL "com.github.actions.name"="Jekyll Action"
LABEL "com.github.actions.description"="A GitHub Action to build and publish Jekyll sites through scp"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="blue"
COPY LICENSE README.md /

#RUN apt-get update && \
#    apt-get install --no-install-recommends -y \
#        bundler && \
#    apt-get install --no-install-recommends -y \
#        openssh-client && \
#    apt-get install --no-install-recommends -y \
#        git build-essential && \
#    bundle config --global silence_root_warning 1

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
