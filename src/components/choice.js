import React, { useState,  useCallback } from 'react'
import classNames from 'classnames'

import { Button } from './button'
import classes from '../styles/choice.module.sass'

var asel = []
const Choice = ({ id = '0', children = [] }) => {
    //var selected_buffer
    function updateSelection (i) {
      //console.log(">>> FROM CLICK")
      //console.log("> i:")
      //console.log(i)
      //console.log("> selected:")
      //console.log(selected)
      //console.log(options)
      //console.log("")
      //.setState({test: i})
      //selected_buffer = i
      //console.log("asel.includes")
      //console.log(i)
      //console.log(asel.includes(i))
      //console.log("CHANGE")
      //options[1].props.test = "bla"
      //{options.map(({ key, props }, i) => {
         //props.test = i
      //})}
      //console.log("> Selection at start of update:")
      //console.log(asel)

      if (asel.includes(i)) {
        // Remove i from selected items and set selection to undefined:
        console.log("> asel includes i!")
        for (var k = 0; k < asel.length; k++) {
          if (asel[k] === i) {
            asel.splice(k, 1)
            setSelected(undefined)
            console.log("> Remove i from asel, new asel is:")
            console.log(asel)
          }
        }
      } else {
        console.log("> asel does not include i")
        asel.push(i)
        console.log("> Include i to asel:")
        console.log(asel)
        setSelected(i)
        console.log("> Set selected to i")
      }
      console.log("selected is")
      console.log(selected)
      if (selected === undefined) {
        setSelected(i)
        console.log("Update selected from undefined to i")
      }
      //asel.push(i)
      //console.log(asel)
      //console.log(asel.includes(i))
      //console.log(options)
    }
    function changeUpdate (i) {
      console.log(">> FORM CHANGE")
      //if (selected === undefined) {
        //setSelected(i)
      //}
    }
    //function easyUpdateSelection (i) {
      //console.log("CLICK")
      //console.log(options)
      //if (asel.includes(i)) {
        //updateSelection(i)
      //} else {
        //setSelected(i)
        //selected_buffer = i
      //}
    //}
    var rr_corr = []
    const [selected, setSelected] = useState(null)
    const [answer, setAnswer] = useState(null)
    const handleAnswer = useCallback(() => setAnswer(selected), [selected])
    //const handleAnswer = useCallback(() => setAnswer(selected_buffer), [selected_buffer])
    const options = children.filter(child => child !== '\n')
    // Required to prevent the "Submit" button from not reacting due to undefined selected:
    //const options = children
    {options.map(({ key, props }, i) => {
       const isCorrect = props.correct
       if (isCorrect) { rr_corr.push(i) }
    })}
    const [correct, setCorrect] = useState(null)
    function updateAnswer () {
      setAnswer(1)
      var has_equal_length = asel.length === rr_corr.length
      var tmp = true
      if (has_equal_length) {
        for (var k = 0; k < asel.length; k++) {
          if (!rr_corr.includes(asel[k])) {
            tmp = false
          }
        }
      } else {
        tmp = false
      }
      setCorrect(tmp)
    }
    return (
        <>
            {options.map(({ key, props }, i) => (
                <form key={key} className={classes.option}>
                    <input
                        className={classes.input}
                        name={`choice-${id}`}
                        id={`choice-${id}-${i}`}
                        value={i}
                        type="radio"
                        checked={asel.includes(i)}
                        onChange={() => changeUpdate(i)}
                        onClick={() => updateSelection(i)}
                    />
                    <label
                        className={classes.label}
                        htmlFor={`choice-${id}-${i}`}
                        dangerouslySetInnerHTML={{ __html: `<span>${props.text}</span>` }}
                    />
                </form>
            ))}

            <Button variant="primary" onClick={updateAnswer}>
                Submit
            </Button>
            {options.map(({ key, props }, i) => {
                const isCorrect = !!props.correct
                return answer === i ? (
                    <div
                        key={key}
                        className={classNames(classes.answer, { [classes.correct]: isCorrect && correct })}
                    >
                        <strong
                            className={classNames(classes.answerLabel, {
                                [classes.answerLabelCorrect]: isCorrect && correct,
                            })}
                        >
                            {isCorrect && correct ? "That's correct! " : 'Incorrect. '}
                        </strong>
                        {props.children}
                    </div>
                ) : null
            })}




        </>
    )
}

export const Option = ({ children }) => {
    return children
}

export default Choice
