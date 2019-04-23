<div class="pull-right">
    <!-- search form -->
    <form action="{{$route}}" method="GET">
        <div class="input-group">
            <input type="text" name="q" class="form-control" placeholder="Search..." value="{!! request()->input('q') !!}" required>
            <span class="input-group-btn">
                <button type="submit" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i> Search </button>
            </span>
        </div>
    </form>
    <!-- /.search form -->
</div>