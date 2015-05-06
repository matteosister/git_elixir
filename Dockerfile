FROM nifty/elixir

ADD . /app
WORKDIR /app
RUN which git
RUN mix local.hex --force
RUN mix deps.get