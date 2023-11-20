let combine = classNames => {
  let unwrapedClassNames = Belt.Array.keepMapU(classNames, (. x) => x)
  Js.Array2.joinWith(unwrapedClassNames, " ")
}
