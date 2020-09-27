pragma solidity ^0.6.12;

contract OnlineClassAttendance {
  string public studentId;
  string public date;

  constructor(string memory student, string memory classDate) public {
    studentId = student;
    date = classDate;
  }

  function update(string memory classDate) public {
    date = classDate;
  }

  function verifyAttendance() public view returns (string memory){
    return string(abi.encodePacked(studentId, " attended class on ", date));
  }
}