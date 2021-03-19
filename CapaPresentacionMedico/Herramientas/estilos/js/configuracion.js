$('input[type="file"]').each(function () {

    var $file = $(this),
        $label = $file.next('label'),
        $labelText = $label.find('span'),
        labelDefault = $labelText.text();

    $file.on('change', function (event) {
        var fileName = $file.val().split('\\').pop(),
            tmppath = URL.createObjectURL(event.target.files[0]);
        if (fileName) {
            $label
                .addClass('file-ok')
                .css('background-image', 'url(' + tmppath + ')');
            $labelText.text(fileName);
        } else {
            $label.removeClass('file-ok');
            $labelText.text(labelDefault);
        }
    });

});