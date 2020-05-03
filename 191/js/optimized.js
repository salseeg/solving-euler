const run    = (d) => d == 1 ? 3 : runL(d-1) + runA(d-1) + run(d-1)
const runA   = (d) => d == 1 ? 3 : runL(d-1) + runAA(d-1) + run(d-1)
const runAA  = (d) => d == 1 ? 2 : runL(d-1) + run(d-1)
const runL   = (d) => d == 1 ? 2 : runL(d-1) + runLA(d-1)
const runLA  = (d) => d == 1 ? 2 : runL(d-1) + runLAA(d-1)
const runLAA = (d) => d == 1 ? 1 : runL(d-1)

const main = (n) => run(n);

const myArgs = process.argv.slice(2);
const [n] = myArgs;
const startTime = Date.now() / 1000;
const res = main(n);
const endTime = Date.now() / 1000;
console.log('Result: ', res);
console.log('Time:', endTime - startTime);

