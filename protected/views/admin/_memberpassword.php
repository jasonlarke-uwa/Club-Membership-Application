<?php
/* @var $this AdminController */
/* @var $model AdminChangeMemberPassword */
/* @var $form CActiveForm */

$baseUrl = Yii::app()->baseUrl; 
//same css?
Yii::app()->clientScript->registerCssFile($baseUrl.'/css/registration.css');
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'changePassword-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
	<?php if ($model->succeeded) { ?>
		<div>Successfully updated.</div>
	<?php } ?>
	
	<div class="row">
		<?php echo $form->labelEx($model, 'username'); ?>
		<?php echo $form->textField($model, 'username', array('size'=>30,'maxlength'=>40)); ?>
		<?php echo $form->error($model, 'username'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model, 'newPassword'); ?>
		<?php echo $form->passwordField($model, 'newPassword', array('size'=>30,'maxlength'=>40)); ?>
		<?php echo $form->error($model, 'newPassword'); ?>		
	</div>

	<div class="row">
		<?php echo $form->labelEx($model, 'repeatNewPassword'); ?>
		<?php echo $form->passwordField($model, 'repeatNewPassword', array('size'=>30,'maxlength'=>40)); ?>
		<?php echo $form->error($model, 'repeatNewPassword'); ?>		
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Change'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
