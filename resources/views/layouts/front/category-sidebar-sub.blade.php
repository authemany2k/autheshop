    @foreach($categories as $category)
        <ul class="list-unstyled sidebar-category-sub">
            @if($category->children()->count() > 0)
                @include('layouts.front.category-sub', ['subs' => $category->children])
            @endif
        </ul>

    @endforeach
