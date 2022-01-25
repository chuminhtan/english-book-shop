<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
	crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.richtext.min.js"></script>

<!-- Show message with Sweet Alert -->
<script>
	const successMessage = (title, url) => {
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: false,
			  timer: 1000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  },

			})

			Toast.fire({
			  icon: 'success',
			  title: title
			}).then((result) =>{
				if (url === 'nothing'){
					return;
				}
				
				if (url === null) {
					location.reload();
				} else{
					window.location.assign(url); 
				} 
	  	})

	}

	const errorMessage = (title) => {
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
			  icon: 'error',
			  title: title
			}).then((result) =>{
				location.reload();
	  	})
	}

	const infoMessage = (title) => {
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  showConfirmButton: false,
			  timer: 2000,
			  timerProgressBar: true,
			  didOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer),
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  },
			})
			
			Toast.fire({
			  icon: 'info',
			  title: title
			})
	  	}

	let message = '${MESSAGE}' 
	if (message.length > 0) {
		infoMessage(message);
	}

	
</script>

<script>
	function confirmDelete(type, id, action) {
		
	    if (id == 1) {
	        Swal.fire({
	            title: 'The default '+ type +' cannot be deleted',
	            icon: 'info'
	        })      
	        return;
	    }
	    
	    Swal.fire({
	        title: 'Are you sure you want to delete?',
	        text: 'The ' + type + ' with ID ' + id + ' will be deleted',
	        icon: 'question',
	        showCancelButton: true,
	        confirmButtonColor: '#3085d6',
	        cancelButtonColor: '#d33',
	        confirmButtonText: 'Yes, delete it!'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            deleteWithGet(action, id)
	        }
	    })
	}

	async function deleteWithGet(action, id) {
	    const url = action + '?id=' + id;
	    const result = await sendGetData(url, id);

        Swal.fire({
	            title: result.MESSAGE,
	            icon: 'info',
        }).then((result) => {
        	  if (Swal.DismissReason.backdrop) {
        		  window.location.reload();
        	  }
        	})	
	}

	async function sendGetData(url, id) {
	    const response = await fetch(url, {
	        method: 'GET',
	        mode: 'cors',
	        cache: 'no-cache',
	        headers: {
	            'Content-Type': 'application/json'
	        },
	        redirect: 'follow',
	        referrerPolicy: 'no-referrer',
	    });
	    return response.json();
	}	
</script>

<script>
	$(document).ready(function(){

		$('.content').richText();
	});
</script>

<!-- ADD BOOK TO CART -->
<script>
	const addBookToCart = async (btn) => {

		let bookId = btn.id;
		let url = '${pageContext.request.contextPath}/add-book-to-cart?bookId=' + bookId;

		const response = await fetch(url, {
		      method: 'GET',
		      mode: 'cors',
		      cache: 'no-cache',
		      headers: {
		            'Content-Type': 'application/json'
		      },
		      redirect: 'follow',
		      referrerPolicy: 'no-referrer',
		    });
		const result = await response.json();

		console.log(result);

		if (result.result='OK') {
		// Set quantity
			let spanTotalQuantity = document.getElementById('span-total-quantity');
			spanTotalQuantity.innerHTML = result.totalQuantity;

			successMessage('Added Successfully','nothing');
		}
		console.log(response)
		if(response.status == 500){
			failMessage('Something Wrong. Please Try Again');
		}

	}
	
	</script>