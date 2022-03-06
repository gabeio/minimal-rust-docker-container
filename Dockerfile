FROM rust:alpine as build

RUN apk add --no-cache musl-dev

COPY . .

RUN cargo build --release

FROM scratch

COPY --from=build ./target/release/warp /warp

ENTRYPOINT ["/warp"]
