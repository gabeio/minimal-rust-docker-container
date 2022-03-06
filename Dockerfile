FROM rust:alpine as build

COPY ./Cargo.* ./
COPY ./src ./

RUN cargo build --release

FROM scratch

COPY --from=build ./target/release/warp /warp

ENTRYPOINT ["/warp"]
