const quotes = [
    {
        quote : "잘한다는 기준이 너무 애매해서 모두를 만족시킬 수는 없으니까 네가 네것을 찾고, 너만의 것을 좋아해주는 사람들을 만나면 돼.",
        author : "아이유",
    },
    {
        quote : "나 또한 불안하고 당신 또한 그러하니 같이 찾고 공부해봅시다.",
        author : "슈가",
    },
    {
        quote : "최선을 다했지만 어쩔 수 없는 일은 털어버릴 줄도 알아야 한다. 세상에 미련만큼 미련한 일도 없다.",
        author : "지드래곤",
    },
    {
        quote : "잘 모르고 무식한 사람이 신념을 가지면 무섭습니다.",
        author : "이광규",
    },
    {
        quote : "적게 말하고 많이 들어라. 들을수록 내 편이 많아진다.",
        author : "유재석",
    },
    {
        quote : "지금 공부 안하면 더울 때 더운데서 일하고 추울 때 추운데서 일한다",
        author : "박명수",
    },
    {
        quote : "어쩌겠습니까?  해내야죠!",
        author : "박은빈",
    },
    {
        quote : "오히려 좋아.",
        author : "침착맨",
    },
    {
        quote : "3등은 괜찮다, 하지만 3류는 안된다",
        author : "김태원",
    },
    {
        quote : "운이라는 것은 기회가 준비와 만난 것이다.",
        author : "안철수",
    }
];

const quote = document.querySelector("#quote span:first-child");
const author = document.querySelector("#quote span:last-child");
const todaysQuote = quotes[Math.floor(Math.random() * quotes.length)];

quote.innerText = todaysQuote.quote;
author.innerText = todaysQuote.author;