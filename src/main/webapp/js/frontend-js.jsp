<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">

 	const sendLoginForm = async (event) => {
        event.preventDefault();
    	const passLogin = document.getElementById("password-login");
    	const emailLogin = document.getElementById("email-login");

        let email = emailLogin.value;
        let password = passLogin.value;

        const data = {email, password};
        const url = 'login';
        
        const response = await fetch(url, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: JSON.stringify(data)
        });
        const result = await response.json();

        if (result.result === 'success') {
            	successMessage('Signed in successfully', null);
            } else {
				errorMessage('Logged Fail', null);
           }
    }
	<c:if test="${LOGGED_CUSTOMER == null }">
		document.getElementById("form-login").addEventListener("submit", sendLoginForm);
	</c:if>
</script>