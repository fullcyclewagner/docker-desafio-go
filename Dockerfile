FROM golang:alpine as gomake

WORKDIR /app
COPY *.go .
RUN go build *.go

FROM scratch
WORKDIR /
COPY --from=gomake /app/main .

ENTRYPOINT [ "./main" ]
CMD [ "FullCycle Rocks!" ]