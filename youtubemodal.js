function openModal(id) {
    var src = "https://www.youtube-nocookie.com/embed/" + id + "?autoplay=1;rel=0&amp;showinfo=0;";
    $('#' + id + ' iframe').attr('src', src);
};

function closeModal(id) {
    $('#' + id + ' iframe').removeAttr('src');
};