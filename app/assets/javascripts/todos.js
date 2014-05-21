var count = 1000;

$(document).ready(function() {

    //add new todo
    $("#todo-form").on('submit', function(e) {
        e.preventDefault();
        var text = $('input').val();
        if (!text.length) {
            return;
        } else {
            addTodo({
                text: text,
                completed: false
            });
            $('input').val("");
        }
    });

    $('ul').on('click', 'li', function() {
        var todo = $(this);
        if (todo.hasClass('completed')) {
            todo.removeClass('completed');
        } else {
            todo.addClass('completed');
        }

    });

    $('ul').on('click', 'span', function() {
        $(this).parent().remove();
    });

    addTodo = function(todoItem) {
        if (!todoItem.id) {
            todoItem.id = count;
            count += 1;
        }
        var $newTodo = $('<li data-id="' + todoItem.id + '"></li>');

        if (todoItem.completed) {
            $newTodo.addClass("completed");
        }
        $newTodo.append(todoItem.text + '<span class="delete">Delete</span>');

        $newTodo.hide().appendTo('ul').fadeIn(500);
        console.log($newTodo);
    };

    $('#deleteAll').click(function() {
        $('li.completed').fadeOut(500, function() {
            $(this).remove();
        });
    });

    // Array of todos
    var todos = [];
    $.get('/todos.json').done(function(data) {
        todos = data
        $.each(todos, function(index, item) {
            addTodo(item);
        });
    });
});