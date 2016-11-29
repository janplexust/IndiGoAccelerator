<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h2><?php echo $heading_title; ?></h2>
            <div class="button-group">

                <button type="button"
                        onclick="globService.category.share($('#input-product-id').val());">
                    <span class="hidden-xs">Share</span> <i class="fa fa-share-alt"></i>
                </button>

                <button type="button"
                        onclick="globService.category.like($('#input-product-id').val());">
                    <span class="hidden-xs">Like</span> <i class="fa fa-thumbs-o-up"></i>
                </button>

                <button type="button"
                        onclick="globService.category.dislike($('#input-product-id').val());">
                    <span class="hidden-xs">Dislike</span> <i class="fa fa-thumbs-o-down"></i>
                </button>
            </div>


            <form class="form-horizontal" id="form-review">
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label" for="input-review">Comment</label>
                        <textarea name="text" rows="1" id="input-review" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group required">
                    <div class="col-sm-12">
                        <label class="control-label">Rate</label>
                        &nbsp;&nbsp;&nbsp;Bad&nbsp;
                        <input type="radio" name="rating" value="1" />
                        &nbsp;
                        <input type="radio" name="rating" value="2" />
                        &nbsp;
                        <input type="radio" name="rating" value="3" />
                        &nbsp;
                        <input type="radio" name="rating" value="4" />
                        &nbsp;
                        <input type="radio" name="rating" value="5" />
                        &nbsp;Good</div>
                </div>
                <div class="buttons clearfix">

                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"
                            onclick="var rate = $('input[name=rating]:checked').val();globService.category.rate(id, rate);globService.category.comment(id, $('textarea#input-review').val());">
                        <?php echo $button_continue; ?></button>

                </div>
            </form>


            <?php if ($thumb || $description) { ?>
            <div class="row">
                <?php if ($thumb) { ?>
                <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
                <?php } ?>
                <?php if ($description) { ?>
                <div class="col-sm-10"><?php echo $description; ?></div>
                <?php } ?>
            </div>
            <hr>
            <?php } ?>
            <?php if ($categories) { ?>
            <h3><?php echo $text_refine; ?></h3>
            <?php if (count($categories) <= 5) { ?>
            <div class="row">
                <div class="col-sm-3">
                    <ul>
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
            </div>
            <?php } else { ?>
            <div class="row">
                <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
                <div class="col-sm-3">
                    <ul>
                        <?php foreach ($categories as $category) { ?>
                        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                        <?php } ?>
                    </ul>
                </div>
                <?php } ?>
            </div>
            <?php } ?>
            <?php } ?>
            <?php if ($products) { ?>
            <div class="row">
                <div class="col-md-2 col-sm-6 hidden-xs">
                    <div class="btn-group btn-group-sm">
                        <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                        <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="form-group">
                        <a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a>
                    </div>
                </div>
                <div class="col-md-4 col-xs-6">
                    <div class="form-group input-group input-group-sm">
                        <label class="input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
                            <?php foreach ($sorts as $sorts) { ?>
                            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div class="form-group input-group input-group-sm">
                        <label class="input-group-addon" for="input-limit"><?php echo $text_limit; ?></label>
                        <select id="input-limit" class="form-control" onchange="location = this.value;">
                            <?php foreach ($limits as $limits) { ?>
                            <?php if ($limits['value'] == $limit) { ?>
                            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                            <?php } else { ?>
                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                            <?php } ?>
                            <?php } ?>
                        </select>
                    </div>
                </div>
            </div>
            <div class="row">
                <h1>Category Landing page with id=<?php echo $_GET['path']; ?></h1>
            </div>
            <?php } ?>
            <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<script>
    console.log('init category_landing page');
    globService.init('category_landing', {lang: 'en', currency: 'USD'});
    var id = '<?php echo $_GET['path']; ?>';
    globService.category.view(id);
</script>
<?php echo $footer; ?>
