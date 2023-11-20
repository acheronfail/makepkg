image_name := "acheronfail/makepkg"

build:
  docker build . -t {{image_name}}

run *args: build
  docker run --rm -ti {{image_name}} {{args}}

push: build
  docker push {{image_name}}
