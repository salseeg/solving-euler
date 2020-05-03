const run = (lateCount, absentCount, daysToGo) =>
{
    if (absentCount > 2 || lateCount > 1) {
        return 0;
    }

    if (daysToGo === 0) {
        return 1;
    }

    return run(lateCount + 1, 0, daysToGo - 1)
        +  run(lateCount, 0, daysToGo - 1)
        +  run(lateCount, absentCount + 1, daysToGo - 1);
}


const main = (n) => run(0,0, n);

const myArgs = process.argv.slice(2);
const [n] = myArgs;
const startTime = Date.now() / 1000;
const res = main(n);
const endTime = Date.now() / 1000;
console.log('Result: ', res);
console.log('Time:', endTime - startTime);

