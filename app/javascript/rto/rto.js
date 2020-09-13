$( document ).ready(function(){
  $('#rto_table').DataTable({
    serverSide: true,
    ordering: false,
    ajax: {
      url: '/rtos',
      contentType: 'application/json',
      dataType: 'json'
    },
  });
});
