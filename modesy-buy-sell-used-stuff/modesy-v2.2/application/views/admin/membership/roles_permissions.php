<?php defined('BASEPATH') or exit('No direct script access allowed'); ?>
<div class="box">
    <div class="box-header with-border">
        <div class="left">
            <h3 class="box-title"><?php echo trans("roles_permissions"); ?></h3>
        </div>
        <div class="right">
            <a href="<?php echo admin_url(); ?>add-role" class="btn btn-success btn-add-new">
                <i class="fa fa-plus"></i>&nbsp;&nbsp;<?php echo trans("add_role"); ?>
            </a>
        </div>
    </div>
    <div class="box-body">
        <div class="row">
            <div class="col-sm-12">
                <?php $this->load->view('admin/includes/_messages'); ?>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped" role="grid">
                        <thead>
                        <tr role="row">
                            <th><?= trans("role_name"); ?></th>
                            <th><?= trans("permissions"); ?></th>
                            <th class="max-width-120"><?= trans("options"); ?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php if (!empty($roles)):
                            foreach ($roles as $item):
                                $role_name = @parse_serialized_name_array($item->role_name, $this->control_panel_lang->id, true); ?>
                                <tr>
                                    <td class="font-600"><?= $role_name;
                                        if ($item->is_default):?>
                                            &nbsp;<label class="label label-default"><?= trans("default"); ?></label>
                                        <?php endif; ?>
                                    </td>
                                    <td>
                                        <?php if ($item->permissions == "all"): ?>
                                            <label class="label label-success"><?= trans("all_permissions"); ?></label>
                                        <?php endif;
                                        $permissions = @explode(',', $item->permissions);
                                        if (!empty($permissions) && is_array($permissions)):
                                            foreach ($permissions as $index):
                                                $permission = get_permission_by_index($index);
                                                if (!empty($permission)):?>
                                                    <label class="label label-success"><?= trans($permission); ?></label>
                                                <?php endif;
                                            endforeach;
                                        endif; ?>
                                    </td>
                                    <td style="width: 180px;">
                                        <?php if ($item->is_default == 1): ?>
                                            <a href="<?php echo admin_url(); ?>edit-role/<?= $item->id; ?>" class="btn btn-sm btn-default btn-edit"><i class="fa fa-edit"></i>&nbsp;&nbsp;<?php echo trans("edit"); ?></a>
                                        <?php else: ?>
                                            <div class="btn-group btn-group-option">
                                                <a href="<?php echo admin_url(); ?>edit-role/<?= $item->id; ?>" class="btn btn-sm btn-default btn-edit"><i class="fa fa-edit"></i>&nbsp;&nbsp;<?php echo trans("edit"); ?></a>
                                                <a href="javascript:void(0)" class="btn btn-sm btn-default btn-delete" onclick='delete_item("membership_controller/delete_role_post","<?php echo $item->id; ?>","<?php echo trans("confirm_delete"); ?>");'><i class="fa fa-trash-o"></i></a>
                                            </div>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                            <?php endforeach;
                        endif; ?>
                        </tbody>
                    </table>
                    <?php if (empty($roles)): ?>
                        <p class="text-center">
                            <?php echo trans("no_records_found"); ?>
                        </p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>