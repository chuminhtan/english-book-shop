<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	let message = '${MESSAGE}' 
	if (message.length > 0) {
	Swal.fire(message)
	message=''
	}
</script>

<script>
	function confirmDelete(type, id, action) {
		
	    if (id == 1) {
	        Swal.fire({
	            title: 'The default '+ type +' cannot be deleted',
	            icon: 'info'

	        })
	        
	        return
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

