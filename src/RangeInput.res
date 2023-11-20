@module external styles: {..} = "./RangeInput.module.css"

@react.component
let make = (~value, ~onValue, ~min=?, ~max=?, ~step=?, ~className=?) => {
  let handleChange = event => {
    ReactEvent.Form.preventDefault(event)
    let value = ReactEvent.Form.target(event)["value"]
    onValue(value)
  }

  let min = Belt.Option.map(min, Belt.Int.toString)
  let max = Belt.Option.map(max, Belt.Int.toString)

  let className = Classname.combine([Some(styles["input"]), className])

  <input type_="range" value onChange={handleChange} ?min ?max ?step className />
}
