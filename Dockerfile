FROM rust:alpine as build

COPY . .

RUN cargo build --release

FROM scratch

COPY --from=build ./target/release/warp /warp

ENTRYPOINT ["/warp"]
