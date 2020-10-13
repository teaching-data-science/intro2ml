import React, { useState,  useCallback } from 'react'
import classNames from 'classnames'

import { Button } from './button'
import classes from '../styles/choice.module.sass'

//const  asel = []
const Choice = ({ id = '0', children = [] }) => {
    //var selected_buffer
    const [asel, setAsel] = useState([])
    function updateSelection (asel_tmp, i) {
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

      if (asel_tmp.includes(i)) {
        // Remove i from selected items and set selection to undefined:
        //console.log("> asel includes i!")
        for (var k = 0; k < asel_tmp.length; k++) {
          if (asel_tmp[k] === i) {
            asel_tmp.splice(k, 1)
            setSelected(undefined)
            //console.log("> Remove i from asel, new asel is:")
            //console.log(asel)
          }
        }
      } else {
        //console.log("> asel does not include i")
        asel_tmp.push(i)
        //console.log("> Include i to asel:")
        //console.log(asel)
        setSelected(i)
        //console.log("> Set selected to i")
      }
      //console.log("selected is")
      //console.log(selected)
      if (selected === undefined) {
        setSelected(i)
        //console.log("Update selected from undefined to i")
      }
      //asel.push(i)
      //console.log(asel)
      //console.log(asel.includes(i))
      //console.log(options)
      return asel_tmp
    }
    function changeUpdate (i) { }
    var rr_corr = []
    const [selected, setSelected] = useState(null)
    const [answer, setAnswer] = useState(null)
    const handleAnswer = useCallback(() => setAnswer(selected), [selected])
    const options = children.filter(child => child !== '\n')
    // Required to prevent the "Submit" button from not reacting due to undefined selected:
    //const options = children
    {options.map(({ key, props }, i) => {
       const isCorrect = props.correct
       if (isCorrect) { rr_corr.push(i) }
    })}
    const [all_correct, setCorrect] = useState(null)
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
                        onClick={() => setAsel(updateSelection(asel, i))}
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
                        className={classNames(classes.answer, { [classes.correct]: isCorrect && all_correct })}
                    >
                        <strong
                            className={classNames(classes.answerLabel, {
                                [classes.answerLabelCorrect]: isCorrect && all_correct,
                            })}
                        >
                            {isCorrect && all_correct ? "That's correct! " : 'Incorrect. '}
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
