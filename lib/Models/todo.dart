

class Todo{
    String id ;
    String title;
    String dropdown;
    bool completed;

    Todo({required this.id, required this.title,required this.dropdown ,required this.completed});

    Todo copyWith({
        String? id,
        String? title,
        String? dropdown,
        bool? completed,
    }) {
        return Todo(
            id: id ?? this.id,
            title: title ?? this.title,
            dropdown: dropdown ?? this.dropdown,
            completed: completed ?? this.completed,
        );
    }
}