@module external styles: {..} = "./App.module.css"

@react.component
let make = () => {
  let (text, setText) = React.useState(_ => "")
  let (fontSize, setFontSize) = React.useState(_ => "48")
  let (letterSpacing, setLetterSpacing) = React.useState(_ => "0.0")
  let (fontWeight, setFontWeight) = React.useState(_ => "400")

  let handleText = event => {
    ReactEvent.Form.preventDefault(event)
    let value = ReactEvent.Form.target(event)["value"]
    setText(_ => value)
  }

  let fontSizePx = `${fontSize}px`
  let letterSpacingEm = `${letterSpacing}em`

  let textAreaStyle = ReactDOMStyle.make(
    ~fontSize=fontSizePx,
    ~letterSpacing=letterSpacingEm,
    ~fontWeight,
    (),
  )

  <div className={styles["viewport"]}>
    <div className={styles["container"]}>
      <textarea
        autoFocus={true}
        className={styles["text"]}
        style={textAreaStyle}
        onChange={handleText}
        value={text}
        placeholder="The quick brown fox jumps over the lazy dog."
      />
      <div className={styles["configuration"]}>
        <div className={styles["field"]}>
          <div className={styles["label"]}> {React.string(`Font size (${fontSizePx})`)} </div>
          <RangeInput value={fontSize} onValue={setFontSize} min={8} max={256} step={1.0} />
        </div>
        <div className={styles["field"]}>
          <div className={styles["label"]}>
            {React.string(`Letter spacing (${letterSpacingEm})`)}
          </div>
          <RangeInput
            value={letterSpacing} onValue={setLetterSpacing} min={0} max={1} step={0.01}
          />
        </div>
        <div className={styles["field"]}>
          <div className={styles["label"]}> {React.string(`Font weight (${fontWeight})`)} </div>
          <RangeInput value={fontWeight} onValue={setFontWeight} min={100} max={900} step={100.0} />
        </div>
      </div>
    </div>
  </div>
}
