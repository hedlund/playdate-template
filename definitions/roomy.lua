---@meta

---@class Room : Object
Room = {}

function Room:__tostring() end

function Room:init() end

---@param previous Room
function Room:enter(previous) end

---@param next Room
function Room:leave(next) end

---@param previous Room
function Room:pause(previous) end

---@param next Room
function Room:resume(next) end

function Room:clear() end

function Room:cacheSprites() end

---@class PauseRoom : Room
PauseRoom = {}

function PauseRoom:enter(...) end

---@class Manager : Object
Manager = {}

function Manager:printStack() end

function Manager:init() end

function Manager:hook(options) end

function Manager:emit(event, ...) end

function Manager:enter(next, ...) end

function Manager:resetAndEnter(next, ...) end

function Manager:push(next, ...) end

function Manager:pop(...) end
