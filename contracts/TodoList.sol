pragma solidity ^0.5.0;

contract TodoList {
  uint public taskCount = 0; //unsigned integer cant be negative
  //used for iterating map because it can't do it without counting 

  struct Task {
    uint id;
    string content; //the text
    bool completed;
  }

  mapping(uint => Task) public tasks; //asociative array - like a database, dynamic, can't iderate

  event TaskCreated( //function
    uint id,
    string content,
    bool completed
  );

  event TaskCompleted(
    uint id,
    bool completed
  );

  constructor() public {
    createTask("Check out dappuniversity.com"); //create default a task - constructor
  }

  function createTask(string memory _content) public { //puts task inside mapping
    taskCount ++;
    tasks[taskCount] = Task(taskCount, _content, false); //create a new task
    emit TaskCreated(taskCount, _content, false); //
  }

  function toggleCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    emit TaskCompleted(_id, _task.completed);
  }

}