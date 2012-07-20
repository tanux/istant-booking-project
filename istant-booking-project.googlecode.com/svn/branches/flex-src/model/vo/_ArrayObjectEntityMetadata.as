
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
internal class _ArrayObjectEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("STD_PROP_LIST", "ARRAY_AS_PROPS");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("STD_PROP_LIST", "ARRAY_AS_PROPS");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("STD_PROP_LIST", "ARRAY_AS_PROPS");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("STD_PROP_LIST", "ARRAY_AS_PROPS");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("STD_PROP_LIST", "ARRAY_AS_PROPS");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "ArrayObject";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _STD_PROP_LISTIsValid:Boolean;
    model_internal var _STD_PROP_LISTValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _STD_PROP_LISTIsValidCacheInitialized:Boolean = false;
    model_internal var _STD_PROP_LISTValidationFailureMessages:Array;
    
    model_internal var _ARRAY_AS_PROPSIsValid:Boolean;
    model_internal var _ARRAY_AS_PROPSValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _ARRAY_AS_PROPSIsValidCacheInitialized:Boolean = false;
    model_internal var _ARRAY_AS_PROPSValidationFailureMessages:Array;

    model_internal var _instance:_Super_ArrayObject;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _ArrayObjectEntityMetadata(value : _Super_ArrayObject)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["STD_PROP_LIST"] = new Array();
            model_internal::dependentsOnMap["ARRAY_AS_PROPS"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["STD_PROP_LIST"] = "Object";
        model_internal::propertyTypeMap["ARRAY_AS_PROPS"] = "Object";

        model_internal::_instance = value;
        model_internal::_STD_PROP_LISTValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForSTD_PROP_LIST);
        model_internal::_STD_PROP_LISTValidator.required = true;
        model_internal::_STD_PROP_LISTValidator.requiredFieldError = "STD_PROP_LIST is required";
        //model_internal::_STD_PROP_LISTValidator.source = model_internal::_instance;
        //model_internal::_STD_PROP_LISTValidator.property = "STD_PROP_LIST";
        model_internal::_ARRAY_AS_PROPSValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForARRAY_AS_PROPS);
        model_internal::_ARRAY_AS_PROPSValidator.required = true;
        model_internal::_ARRAY_AS_PROPSValidator.requiredFieldError = "ARRAY_AS_PROPS is required";
        //model_internal::_ARRAY_AS_PROPSValidator.source = model_internal::_instance;
        //model_internal::_ARRAY_AS_PROPSValidator.property = "ARRAY_AS_PROPS";
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
            throw new Error(propertyName + " is not a data property of entity ArrayObject");
            
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
            throw new Error(propertyName + " is not a collection property of entity ArrayObject");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of ArrayObject");

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
            throw new Error(propertyName + " does not exist for entity ArrayObject");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity ArrayObject");
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
            throw new Error(propertyName + " does not exist for entity ArrayObject");
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
    public function get isSTD_PROP_LISTAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isARRAY_AS_PROPSAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnSTD_PROP_LIST():void
    {
        if (model_internal::_STD_PROP_LISTIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfSTD_PROP_LIST = null;
            model_internal::calculateSTD_PROP_LISTIsValid();
        }
    }
    public function invalidateDependentOnARRAY_AS_PROPS():void
    {
        if (model_internal::_ARRAY_AS_PROPSIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfARRAY_AS_PROPS = null;
            model_internal::calculateARRAY_AS_PROPSIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get STD_PROP_LISTStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get STD_PROP_LISTValidator() : StyleValidator
    {
        return model_internal::_STD_PROP_LISTValidator;
    }

    model_internal function set _STD_PROP_LISTIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_STD_PROP_LISTIsValid;         
        if (oldValue !== value)
        {
            model_internal::_STD_PROP_LISTIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "STD_PROP_LISTIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get STD_PROP_LISTIsValid():Boolean
    {
        if (!model_internal::_STD_PROP_LISTIsValidCacheInitialized)
        {
            model_internal::calculateSTD_PROP_LISTIsValid();
        }

        return model_internal::_STD_PROP_LISTIsValid;
    }

    model_internal function calculateSTD_PROP_LISTIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_STD_PROP_LISTValidator.validate(model_internal::_instance.STD_PROP_LIST)
        model_internal::_STD_PROP_LISTIsValid_der = (valRes.results == null);
        model_internal::_STD_PROP_LISTIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::STD_PROP_LISTValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::STD_PROP_LISTValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get STD_PROP_LISTValidationFailureMessages():Array
    {
        if (model_internal::_STD_PROP_LISTValidationFailureMessages == null)
            model_internal::calculateSTD_PROP_LISTIsValid();

        return _STD_PROP_LISTValidationFailureMessages;
    }

    model_internal function set STD_PROP_LISTValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_STD_PROP_LISTValidationFailureMessages;

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
            model_internal::_STD_PROP_LISTValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "STD_PROP_LISTValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get ARRAY_AS_PROPSStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get ARRAY_AS_PROPSValidator() : StyleValidator
    {
        return model_internal::_ARRAY_AS_PROPSValidator;
    }

    model_internal function set _ARRAY_AS_PROPSIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_ARRAY_AS_PROPSIsValid;         
        if (oldValue !== value)
        {
            model_internal::_ARRAY_AS_PROPSIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ARRAY_AS_PROPSIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get ARRAY_AS_PROPSIsValid():Boolean
    {
        if (!model_internal::_ARRAY_AS_PROPSIsValidCacheInitialized)
        {
            model_internal::calculateARRAY_AS_PROPSIsValid();
        }

        return model_internal::_ARRAY_AS_PROPSIsValid;
    }

    model_internal function calculateARRAY_AS_PROPSIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_ARRAY_AS_PROPSValidator.validate(model_internal::_instance.ARRAY_AS_PROPS)
        model_internal::_ARRAY_AS_PROPSIsValid_der = (valRes.results == null);
        model_internal::_ARRAY_AS_PROPSIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::ARRAY_AS_PROPSValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::ARRAY_AS_PROPSValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get ARRAY_AS_PROPSValidationFailureMessages():Array
    {
        if (model_internal::_ARRAY_AS_PROPSValidationFailureMessages == null)
            model_internal::calculateARRAY_AS_PROPSIsValid();

        return _ARRAY_AS_PROPSValidationFailureMessages;
    }

    model_internal function set ARRAY_AS_PROPSValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_ARRAY_AS_PROPSValidationFailureMessages;

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
            model_internal::_ARRAY_AS_PROPSValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "ARRAY_AS_PROPSValidationFailureMessages", oldValue, value));
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
            case("STD_PROP_LIST"):
            {
                return STD_PROP_LISTValidationFailureMessages;
            }
            case("ARRAY_AS_PROPS"):
            {
                return ARRAY_AS_PROPSValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
