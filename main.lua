#!/usr/local/bin/lua

-- Ensure random is actually random
math.randomseed(os.time())

local options = {
  "rock", "paper", "scissors"
}

local weakAgainst = {
  rock="paper", paper="scissors", scissors="rock"
}

local outcomes ={
  win = "win", lose = "lose", draw = "draw"
}

function tablelength(table)
  local count = 0
  for _ in pairs(table) do count = count + 1 end
  return count
end

function valueExists(value, options)
  for i, opt in pairs(options) do
    if value == opt then
      return true
    end
  end
  return false
end

function getRandomOption(options)
  local numOpts = tablelength(options)
  local randomIndex = math.random(1, numOpts)
  return options[randomIndex]
end

function playGame(userChoice, computedChoice, outcomes)
  local userWeakness = weakAgainst[userChoice]
  if userWeakness == computedChoice then
    return outcomes.lose
  elseif userChoice == computedChoice then
    return outcomes.draw
  else
    return outcomes.win
  end
end

function main()
  local computedChoice = getRandomOption(options)
  local userChoice

  repeat
    io.write("Choose either rock, paper or scissors\n")
    userChoice = io.read()
    io.flush()
  until valueExists(userChoice, options)

  local gameOutcome = playGame(userChoice, computedChoice, outcomes)

  userChoice = string.upper(userChoice)
  computedChoice = string.upper(computedChoice)

  if gameOutcome == outcomes.win then
    io.write([[You played ]] ..userChoice.. [[, the computer played ]] ..computedChoice.. [[. ]]
    ..userChoice.. [[ beats ]] ..computedChoice.. [[, YOU WIN!]])
  elseif gameOutcome == outcomes.lose then
    io.write([[You played ]] ..userChoice.. [[, the computer played ]] ..computedChoice.. [[. ]]
    ..computedChoice.. [[ beats ]] ..userChoice.. [[, YOU LOSE!]])
  elseif gameOutcome == outcomes.draw then
    io.write([[You played ]] ..userChoice.. [[, the computer played ]] ..computedChoice.. [[. ]]
    ..computedChoice.. [[ matches ]] ..userChoice.. [[, YOU DRAW!]])
  end
  io.write('\n')
end

-- run
main()

