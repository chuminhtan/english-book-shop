<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	const passLogin = document.getElementById("password-login");
	const emailLogin = document.getElementById("email-login");
	 
 	const sendLoginForm = async (event) => {
        event.preventDefault();

        let email = emailLogin.value;
        let password = passLogin.value;
        console.log('Email: ', email);
        console.log('Pass: ', password);

        const data = {email, password};
        console.log('Data: ',data);
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
        	const Toast = Swal.mixin({
        		  toast: true,
        		  position: 'top-end',
        		  showConfirmButton: false,
        		  timer: 2000,
        		  timerProgressBar: true,
        		  didOpen: (toast) => {
        		    toast.addEventListener('mouseenter', Swal.stopTimer)
        		    toast.addEventListener('mouseleave', Swal.resumeTimer)
        		  },

        		})

        		Toast.fire({
        		  icon: 'success',
        		  title: 'Signed in successfully'
        		}).then((result) =>{
        			window.location.assign('${pageContext.request.contextPath}'); 
            	})
        		
            } else {
            	const Toast = Swal.mixin({
          		  toast: true,
          		  position: 'top-end',
          		  showConfirmButton: false,
          		  timer: 4000,
          		  timerProgressBar: true,
          		  didOpen: (toast) => {
          		    toast.addEventListener('mouseenter', Swal.stopTimer)
          		    toast.addEventListener('mouseleave', Swal.resumeTimer)
          		  },

          		})

          		Toast.fire({
          		  icon: 'error',
          		  title: 'Login failed'
          		})
           }
    }
	<c:if test="${LOGGED_CUSTOMER == null }">
		document.getElementById("form-login").addEventListener("submit", sendLoginForm);
	</c:if>
</script>