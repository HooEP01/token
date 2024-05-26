import * as React from "react";



const Test = () => {

    type myFunctionParams = Parameters<typeof myFunction>
    type params = {
        value: number,
        args: string
    }

    const myFunction = (value: number, arg2: string) => {
        return value;
    }

    return <>
    
    </>
}

export default Test;