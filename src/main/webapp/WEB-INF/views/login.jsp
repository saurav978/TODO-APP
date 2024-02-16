<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap');
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}
body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: #25252b;
}

@property --a {
  syntax: '<angle>';
  inherits: false;
  initial-value: 0deg;
}

.box {
  position: relative;
  width: 400px;
  height: 200px;
  background: repeating-conic-gradient(
    from var(--a),
    #ff2770 0%,
    #ff2770 5%,
    transparent 5%,
    transparent 40%,
    #ff2770 50%
  );
  filter: drop-shadow(0 15px 50px #000);
  border-radius: 20px;
  animation: rotating 4s linear infinite;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: 0.5s;
}

.box:hover {
  width: 450px;
  height: 500px;
}

@keyframes rotating {
  0% {
    --a: 0deg;
  }
  100% {
    --a: 360deg;
  }
}

.box::before {
  content: '';
  position: absolute;
  width: 100%;
  height: 100%;
  background: repeating-conic-gradient(
    from var(--a),
    #45f3ff 0%,
    #45f3ff 5%,
    transparent 5%,
    transparent 40%,
    #45f3ff 50%
  );
  filter: drop-shadow(0 15px 50px #000);
  border-radius: 20px;
  animation: rotating 4s linear infinite;
  animation-delay: -1s;
}

.box::after {
  content: '';
  position: absolute;
  inset: 4px;
  background: #2d2d39;
  border-radius: 15px;
  border: 8px solid #25252b;
}

.login {
  position: absolute;
  inset: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  border-radius: 10px;
  background: rgba(0, 0, 0, 0.2);
  z-index: 100;
  box-shadow: inset 0 10px 20px rgba(0, 0, 0, 0.5);
  border-bottom: 2px solid rgba(255, 255, 255, 0.5);
  transition: 0.5s;
  color: #fff;
  overflow: hidden;
}

.box:hover .login {
  inset: 40px;
}

.loginBx {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  transform: translateY(125px);
  gap: 20px;
  width: 70%;
  transition: 0.5;
}
.box:hover .loginBx {
  transform: translateY(0);
}
.loginBx form {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  gap: 20px;
  width: 100%;
  transition: 0.5;
}

.loginBx h2 {
  text-transform: uppercase;
  font-weight: 600;
  letter-spacing: 0.2rem;
}
.loginBx h2 i {
  color: #ff2770;
  text-shadow: 0 0 5px #ff2770, 0 0 25px #ff2770;
}

.loginBx input {
  width: 100%;
  padding: 10px 20px;
  outline: none;
  border: none;
  font-size: 1rem;
  color: #fff;
  background: rgba(0, 0, 0, 0.1);
  border: 2px solid #fff;
  border-radius: 30px;
}
.loginBx input::placeholder {
  color: #999;
}
.loginBx input[type='submit'] {
  background: #45f3ff;
  border: none;
  font-weight: 500;
  color: #111;
  cursor: pointer;
  transition: 0.5s;
}

.loginBx input[type='submit']:hover {
  box-shadow: 0 0 10px #45f3ff, 0 0 60px #45f3ff;
}

.group {
  display: flex;
  width: 100%;
  align-items: center;
  justify-content: space-between;
}

.group a {
  color: #fff;
  text-decoration: none;
}
.group a:nth-child(2) {
  color: #ff2770;
  font-weight: 600;
}

.expand {
  width: 450px;
  height: 500px;
}
.login-reset {
  inset: 40px;
}
.loginBx-reset {
  transform: translateY(0);
}
    
    </style>
</head>
<body>
	<div class="box">
      <div class="login">
        <div class="loginBx">
          <h2>
            <i class="fa-solid fa-right-to-bracket"></i>login<i
              class="fa-solid fa-heart"
            ></i>
          </h2>
          <form action="login" method="post">
            <input type="text" placeholder="Username" name="username" />
            <input type="password" placeholder="Password" name="password" />
            <input type="submit" value="Sign in" />
          </form>
          <div class="group">
            <a href="#">Forgot Password</a>
            <a href="open-register">Sign Up</a>
          </div>
        </div>
      </div>
    </div>
    <script>
      let box = document.querySelector('.box');
      let login = document.querySelector('.login');
      let loginBx = document.querySelector('.loginBx');

      box.addEventListener('mouseover', () => {
        box.classList.add('expand');
        login.classList.add('login-reset');
        loginBx.classList.add('loginBx-reset');
      });
    </script>
</body>
</html>