<!-- SCRIPT -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/holder/2.9.4/holder.min.js"
	integrity="sha512-awKijGYZmPF6XI5jaLS45zRNXAGt5HiRKRjAM0HuzRF9U/2oKX+Lh/lYFAZPQAnTRNa1TXERCKm4o1DV5VzJog=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	Holder.addTheme('thumb', {
		bg : '#55595c',
		fg : '#eceeef',
		text : 'Thumbnail'
	});
</script>

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
