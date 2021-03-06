<?php
/***********************************************************************************
 * The contents of this file are subject to the Mozilla Public License Version 2.0
 * ("License"); You may not use this file except in compliance with the Mozilla Public License Version 2.0
 * The Original Code is:  Linet 3.0 Open Source
 * The Initial Developer of the Original Code is Adam Ben Hur.
 * All portions are Copyright (C) Adam Ben Hur.
 * All Rights Reserved.
 ************************************************************************************/
/**
 * This is the model class for table "files".
 *
 * The followings are the available columns in table 'files':
 * @property integer $id
 * @property string $name
 * @property string $path
 * @property string $hidden
 * @property string $public
 * @property integer $parent_id
 * @property string $parent_type //parent module name Items,Docs,Accounts...
 * @property $date
 * @property integer $expire //0 nonoe needs to have auto cleanup for temps
 * @property string $hash
 */
class Files extends CActiveRecord {

    const table = '{{files}}';

    public $handle;

    
    public function save($runValidation = true, $attributes = NULL) {
        
        $a = parent::save($runValidation, $attributes);
        if(($this->public)&&($this->hash=='')){
            
            $download=new Download;
            $download->file_id=$this->id;
            $download->company_id=Yii::app()->user->Company;
            $this->hash=$download->id=md5(mt_rand());
            
            $download->save();
        }

        return $a;
    }
    
    
    
    public function delete() {
        unlink($this->getFullFilePath());
        return parent::delete();
    }

    /**
     * Returns the static model of the specified AR class.
     * @param string $className active record class name.
     * @return BankName the static model class
     */
    public static function model($className = __CLASS__) {
        return parent::model($className);
    }

    public function open() {
        $path_parts = pathinfo($this->getFullPath());
        if (!is_dir($path_parts['dirname']))
            mkdir($path_parts['dirname']);
        $this->handle = fopen($this->getFullFilePath(), 'w');
        $this->save();
    }

    public function close() {
        fclose($this->handle);
    }

    public function readFile() {

        return file_get_contents($this->getFullFilePath());
    }

    public function writeFile($text) {
        $this->open();
        fwrite($this->handle, $text);
        $this->close();
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return self::table;
    }

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('name, path', 'required'),
            array('id, expire,hidden', 'numerical', 'integerOnly' => true),
            array('name, path, parent_type, parent_id, hash', 'length', 'max' => 255),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, name, path, hidden, public, parent_id, parent_type, date, expire, hash', 'safe', 'on' => 'search'),
        );
    }

    public function getFullPath() {
        return Company::getFilePath() . $this->path;
    }

    public function getFullFilePath() {

        return $this->getFullPath() . $this->id;
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => Yii::t('labels', 'ID'),
            'name' => Yii::t('labels', 'Name'),
            'path' => Yii::t('labels', 'Path'),
            'hidden' => Yii::t('labels', 'Hidden'),
            'public' => Yii::t('labels', 'Public'),
            'parent_id' => Yii::t('labels', 'Parent ID'),
            'parent_type' => Yii::t('labels', 'Parent Type'),
            'date' => Yii::t('labels', 'Date'),
            'expire' => Yii::t('labels', 'Expire'), //0-none
            'hash' => Yii::t('labels', 'Hash')
        );
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('name', $this->name, true);
        $criteria->compare('path', $this->path, true);
        $criteria->compare('hidden', $this->hidden);
        $criteria->compare('public', $this->public);
        $criteria->compare('parent_id', $this->parent_id);
        $criteria->compare('parent_type', $this->parent_type, true);
        $criteria->compare('date', $this->date, true);
        $criteria->compare('expire', $this->expire);
        $criteria->compare('hash', $this->hash, true);



        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }

}
