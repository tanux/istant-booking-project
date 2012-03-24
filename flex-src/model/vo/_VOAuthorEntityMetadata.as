
/**
 * This is a generated class and is not intended for modification.  
 */
package model.vo
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _VOAuthorEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("lname_aut", "fname_aut", "id_aut");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("lname_aut", "fname_aut", "id_aut");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("lname_aut", "fname_aut", "id_aut");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("lname_aut", "fname_aut", "id_aut");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("lname_aut", "fname_aut", "id_aut");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "VOAuthor";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _lname_autIsValid:Boolean;
    model_internal var _lname_autValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _lname_autIsValidCacheInitialized:Boolean = false;
    model_internal var _lname_autValidationFailureMessages:Array;
    
    model_internal var _fname_autIsValid:Boolean;
    model_internal var _fname_autValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _fname_autIsValidCacheInitialized:Boolean = false;
    model_internal var _fname_autValidationFailureMessages:Array;
    
    model_internal var _id_autIsValid:Boolean;
    model_internal var _id_autValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _id_autIsValidCacheInitialized:Boolean = false;
    model_internal var _id_autValidationFailureMessages:Array;

    model_internal var _instance:_Super_VOAuthor;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _VOAuthorEntityMetadata(value : _Super_VOAuthor)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["lname_aut"] = new Array();
            model_internal::dependentsOnMap["fname_aut"] = new Array();
            model_internal::dependentsOnMap["id_aut"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["lname_aut"] = "String";
        model_internal::propertyTypeMap["fname_aut"] = "String";
        model_internal::propertyTypeMap["id_aut"] = "String";

        model_internal::_instance = value;
        model_internal::_lname_autValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLname_aut);
        model_internal::_lname_autValidator.required = true;
        model_internal::_lname_autValidator.requiredFieldError = "lname_aut is required";
        //model_internal::_lname_autValidator.source = model_internal::_instance;
        //model_internal::_lname_autValidator.property = "lname_aut";
        model_internal::_fname_autValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForFname_aut);
        model_internal::_fname_autValidator.required = true;
        model_internal::_fname_autValidator.requiredFieldError = "fname_aut is required";
        //model_internal::_fname_autValidator.source = model_internal::_instance;
        //model_internal::_fname_autValidator.property = "fname_aut";
        model_internal::_id_autValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForId_aut);
        model_internal::_id_autValidator.required = true;
        model_internal::_id_autValidator.requiredFieldError = "id_aut is required";
        //model_internal::_id_autValidator.source = model_internal::_instance;
        //model_internal::_id_autValidator.property = "id_aut";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity VOAuthor");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity VOAuthor");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of VOAuthor");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity VOAuthor");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity VOAuthor");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity VOAuthor");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isLname_autAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isFname_autAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isId_autAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnLname_aut():void
    {
        if (model_internal::_lname_autIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLname_aut = null;
            model_internal::calculateLname_autIsValid();
        }
    }
    public function invalidateDependentOnFname_aut():void
    {
        if (model_internal::_fname_autIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfFname_aut = null;
            model_internal::calculateFname_autIsValid();
        }
    }
    public function invalidateDependentOnId_aut():void
    {
        if (model_internal::_id_autIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfId_aut = null;
            model_internal::calculateId_autIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get lname_autStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get lname_autValidator() : StyleValidator
    {
        return model_internal::_lname_autValidator;
    }

    model_internal function set _lname_autIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_lname_autIsValid;         
        if (oldValue !== value)
        {
            model_internal::_lname_autIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lname_autIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get lname_autIsValid():Boolean
    {
        if (!model_internal::_lname_autIsValidCacheInitialized)
        {
            model_internal::calculateLname_autIsValid();
        }

        return model_internal::_lname_autIsValid;
    }

    model_internal function calculateLname_autIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_lname_autValidator.validate(model_internal::_instance.lname_aut)
        model_internal::_lname_autIsValid_der = (valRes.results == null);
        model_internal::_lname_autIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::lname_autValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::lname_autValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get lname_autValidationFailureMessages():Array
    {
        if (model_internal::_lname_autValidationFailureMessages == null)
            model_internal::calculateLname_autIsValid();

        return _lname_autValidationFailureMessages;
    }

    model_internal function set lname_autValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_lname_autValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_lname_autValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lname_autValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get fname_autStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get fname_autValidator() : StyleValidator
    {
        return model_internal::_fname_autValidator;
    }

    model_internal function set _fname_autIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_fname_autIsValid;         
        if (oldValue !== value)
        {
            model_internal::_fname_autIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fname_autIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get fname_autIsValid():Boolean
    {
        if (!model_internal::_fname_autIsValidCacheInitialized)
        {
            model_internal::calculateFname_autIsValid();
        }

        return model_internal::_fname_autIsValid;
    }

    model_internal function calculateFname_autIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_fname_autValidator.validate(model_internal::_instance.fname_aut)
        model_internal::_fname_autIsValid_der = (valRes.results == null);
        model_internal::_fname_autIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::fname_autValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::fname_autValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get fname_autValidationFailureMessages():Array
    {
        if (model_internal::_fname_autValidationFailureMessages == null)
            model_internal::calculateFname_autIsValid();

        return _fname_autValidationFailureMessages;
    }

    model_internal function set fname_autValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_fname_autValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_fname_autValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fname_autValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get id_autStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get id_autValidator() : StyleValidator
    {
        return model_internal::_id_autValidator;
    }

    model_internal function set _id_autIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_id_autIsValid;         
        if (oldValue !== value)
        {
            model_internal::_id_autIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id_autIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get id_autIsValid():Boolean
    {
        if (!model_internal::_id_autIsValidCacheInitialized)
        {
            model_internal::calculateId_autIsValid();
        }

        return model_internal::_id_autIsValid;
    }

    model_internal function calculateId_autIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_id_autValidator.validate(model_internal::_instance.id_aut)
        model_internal::_id_autIsValid_der = (valRes.results == null);
        model_internal::_id_autIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::id_autValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::id_autValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get id_autValidationFailureMessages():Array
    {
        if (model_internal::_id_autValidationFailureMessages == null)
            model_internal::calculateId_autIsValid();

        return _id_autValidationFailureMessages;
    }

    model_internal function set id_autValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_id_autValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_id_autValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id_autValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("lname_aut"):
            {
                return lname_autValidationFailureMessages;
            }
            case("fname_aut"):
            {
                return fname_autValidationFailureMessages;
            }
            case("id_aut"):
            {
                return id_autValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
