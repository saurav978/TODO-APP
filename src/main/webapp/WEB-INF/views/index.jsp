<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
      integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style type="text/css">
    	@import url('https://fonts.googleapis.com/css2?family=Poppins&family=Single+Day&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Jura&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Workbench&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  min-height: 100vh;
  background: linear-gradient(-45deg, #2f4c5e, #01275a, #464646);
}
a {
  color: black;
  text-decoration: none;
}
.main-text {
  /* font-family: 'Single Day', cursive; */
  font-family: 'Poppins', sans-serif;
  text-align: center;
  color: #fff;
  padding-top: 4rem;
  font-size: 6rem;
}

.form {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 2rem;
}

.form input {
  height: 2.5rem;
  width: 23rem;
  border: none;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  padding-left: 10px;
  background: #0099d0;
}
.form input::placeholder {
  color: rgb(40, 40, 40);
  font-weight: bold;
}

.form input:active,
.form input:focus {
  border: none;
  outline: none;
}

.btn {
  border: none;
  height: 2.5rem;
  width: 3.5rem;
  font-weight: bold;
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  cursor: pointer;
}

.task-list {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  margin-top: 3rem;
  gap: 2rem;
}

.task-list li {
  width: 25rem;
  height: 3.5rem;
  list-style: none;
  display: flex;
  align-items: center;
  padding: 0 10px;
  justify-content: space-between;
  background: #007eac;
  border-radius: 20px;
  font-size: 23px;
  font-family: 'Workbench', sans-serif;
  font-family: 'Poppins', sans-serif;
}

.icons {
  display: inline-flex;
  gap: 10px;
}

.circle {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background-color: wheat;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
}

.cross {
  text-decoration: line-through;
}
    	
    </style>
</head>
<body>
	<h1 class="main-text">Just do it</h1>
    <form action="add-todo" method="post" class="form">
      <input type="text" name="item" id="item" placeholder="Add a task" />
      <button type="submit" class="btn">Add</button>
    </form>
    <ul class="task-list">
     ${message}
    </ul>
    <script>
      /*
      const tik = document.querySelectorAll('.circle');
      const text = document.querySelectorAll('.text');
      tik.forEach((item) => {
        item.addEventListener('click', () => {
          item.parentElement.parentElement.parentElement.firstElementChild.classList.add(
            'cross'
          );
        });
      });
      */
      // tik.addEventListener('click', () => {
      //   text.classList.add('cross');
      // });
    </script>
</body>
</html>