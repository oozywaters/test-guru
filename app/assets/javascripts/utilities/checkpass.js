function compareFields(field1, field2) {
    // reset styles
    field1.removeClass('border-success border-danger');
    field2.removeClass('border-success border-danger');

    if (field2.val() === '') {
        return;
    }

    if(field1.val() === field2.val()) {
        field1.addClass('border-success');
        field2.addClass('border-success');
    } else {
        field1.addClass('border-danger');
        field2.addClass('border-danger');
    }
}

document.addEventListener('turbolinks:load', function() {
    var passwordField = $('#user_password');
    var passwordConfirmation = $('#user_password_confirmation');

    if (passwordConfirmation) {
        passwordConfirmation.on('input', function() {
            compareFields(passwordField, passwordConfirmation);
        });
    }
});
