import { useState } from "react"

export default function Button() {
    const [counter, setCounter] = useState(0)

    return <button onClick={() => setCounter(counter + 1)}>Clicado {counter} vezes</button>
}