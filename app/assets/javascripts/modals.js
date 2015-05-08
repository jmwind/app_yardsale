
(function() {
  $(document).ready(function() {
    $(".notify-product-update").on("click", notifyBuyers);
  });
})();

window.notifyBuyers = function() {
  ShopifyApp.Modal.input("E-mail message for buyers:", function(result, data) {
    if(result){
      ShopifyApp.flashNotice("Received: \"" + data + "\"");
    }
    else {
      ShopifyApp.flashNotice("No e-mails sent.");
    }
  });  
}


function filter2 (phrase, _id) {
	var words = phrase.value.toLowerCase().split(" ");
	var table = $(_id);
	var ele;
	for (var r = 1; r < table[0].rows.length; r++){
		ele = table[0].rows[r].innerHTML.replace(/<[^>]+>/g,"");
	        var displayStyle = 'none';
	        for (var i = 0; i < words.length; i++) {
		    if (ele.toLowerCase().indexOf(words[i])>=0)
			displayStyle = '';
		    else {
			displayStyle = 'none';
			break;
		    }
	        }
		table[0].rows[r].style.display = displayStyle;
	}
}


window.alertModal = function(){
  ShopifyApp.Modal.alert('Message for an alert window.');
  return false;
}

window.confirmModal = function () {
  ShopifyApp.Modal.confirm({
    title: "Are you sure you want to delete this?",
    message: "Do you want to delete your account? This can't be undone.",
    okButton: "Yes, delete it",
    cancelButton: "No, keep it",
    style: 'danger'
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("Delete has been confirmed.")
    else
      ShopifyApp.flashNotice("Delete has been cancelled.")
  });

}

window.inputModal = function (prompt) {
  ShopifyApp.Modal.input(prompt, function(result, data){
    if(result){
      ShopifyApp.flashNotice("Received: \"" + data + "\"");
    }
    else{
      ShopifyApp.flashError("Input cancelled.");
    }
  });
}

window.newModal = function(path, title){
  ShopifyApp.Modal.open({
    src: path,
    title: title,
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "OK",
        message: 'modal_ok',
        callback: function(message){
          ShopifyApp.Modal.close("ok");
        }
      },
      secondary: {
        label: "Cancel",
        callback: function(message){
          ShopifyApp.Modal.close("cancel");
        }
      }
    },
  }, function(result){
    if (result == "ok")
      ShopifyApp.flashNotice("'Ok' button pressed")
    else if (result == "cancel")
      ShopifyApp.flashNotice("'Cancel' button pressed")
  });
}

window.newButtonModal = function(path, title){
  ShopifyApp.Modal.open({
    src: path,
    title: title,
    height: 400,
    width: 'large',
    buttons: {
      primary: {
        label: "Yes",
        callback: function(){ alert("'Yes' button clicked"); }
      },
      secondary: [
        {
          label: "Close",
          callback: function(message){ ShopifyApp.Modal.close("close"); }
        },
        {
          label: "Normal",
          callback: function(){ alert("'Normal' button clicked"); }
        }
      ],
      tertiary: [
        {
          label: "Danger",
          style: "danger",
          callback: function(){ alert("'Danger' button clicked"); }
        },
        {
          label: "Disabled",
          style: "disabled"
        }
      ]
    },
  }, function(result){
    if (result)
      ShopifyApp.flashNotice("'" + result + "' button pressed")
    else
      ShopifyApp.flashNotice("No result returned")
  });
}
