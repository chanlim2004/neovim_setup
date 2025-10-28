const getRandomInteger = (min, max) => {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min)) + min;
};
    const randomIntegerInRange = getRandomInteger(5, 10); // Random integer between 5 and 9
    console.log(randomIntegerInRange);


