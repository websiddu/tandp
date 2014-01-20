/* Author:  Siddhartha Gudipati

*/
var myMessages = ['alert', 'warning', 'error', 'success'];
function hideAllMessages() {
    var messagesHeights = new Array(); // this array will store height for each

    for (i = 0; i < myMessages.length; i++) {
        messagesHeights[i] = $('.' + myMessages[i]).outerHeight(); // fill array
        $('.' + myMessages[i]).css('top', -messagesHeights[i]); //move element outside viewport
    }
}
function showMessage(type) {
    $('.' + type + '-trigger').click(function () {
        hideAllMessages();
        $('.' + type).animate({ top: "0" }, 500);
    });
}

    $(document).ready(function () {

        if ((screen.width > 1024) && (screen.height > 768)) {
            $('#photo').fadeIn();

        }
        else {
            // $('#photo').fadeIn(2000);
            $('#photo').fadeOut();
        }

        hideAllMessages();

        // Show message
        for (var i = 0; i < myMessages.length; i++) {
            showMessage(myMessages[i]);
        }

        // When message is clicked, hide it
        $('#alert').click(function () {
            $(this).animate({ top: -$(this).outerHeight() }, 500);
        });            
    });
























