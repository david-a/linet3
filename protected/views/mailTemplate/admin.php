<?php

$this->menu=array(
	//array('label'=>Yii::t('app','List Mail Templates'),'url'=>array('index')),
	array('label'=>Yii::t('app','Create Mail Templates'),'url'=>array('create')),
);



 $this->beginWidget('MiniForm',array(
    'header' => Yii::t('app',"Manage Mail Templates"),

)); 


?>

<?php $this->widget('EExcelView',array(
	'id'=>'acctype-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'name',
		//'desc',
		//'openformat',
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); 

 $this->endWidget(); 


?>
