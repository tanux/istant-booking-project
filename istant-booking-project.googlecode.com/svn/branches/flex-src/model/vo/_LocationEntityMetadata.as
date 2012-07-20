
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
internal class _LocationEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("id", "city", "address", "telephoneNumber", "receptionDays");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("id", "city", "address", "telephoneNumber", "receptionDays");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("id", "city", "address", "telephoneNumber", "receptionDays");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("id", "city", "address", "telephoneNumber", "receptionDays");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("id", "city", "address", "telephoneNumber", "receptionDays");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Location";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _idIsValid:Boolean;
    model_internal var _idValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idIsValidCacheInitialized:Boolean = false;
    model_internal var _idValidationFailureMessages:Array;
    
    model_internal var _cityIsValid:Boolean;
    model_internal var _cityValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _cityIsValidCacheInitialized:Boolean = false;
    model_internal var _cityValidationFailureMessages:Array;
    
    model_internal var _addressIsValid:Boolean;
    model_internal var _addressValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _addressIsValidCacheInitialized:Boolean = false;
    model_internal var _addressValidationFailureMessages:Array;
    
    model_internal var _telephoneNumberIsValid:Boolean;
    model_internal var _telephoneNumberValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _telephoneNumberIsValidCacheInitialized:Boolean = false;
    model_internal var _telephoneNumberValidationFailureMessages:Array;
    
    model_internal var _receptionDaysIsValid:Boolean;
    model_internal var _receptionDaysValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _receptionDaysIsValidCacheInitialized:Boolean = false;
    model_internal var _receptionDaysValidationFailureMessages:Array;

    model_internal var _instance:_Super_Location;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _LocationEntityMetadata(value : _Super_Location)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["id"] = new Array();
            model_internal::dependentsOnMap["city"] = new Array();
            model_internal::dependentsOnMap["address"] = new Array();
            model_internal::dependentsOnMap["telephoneNumber"] = new Array();
            model_internal::dependentsOnMap["receptionDays"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["id"] = "Object";
        model_internal::propertyTypeMap["city"] = "Object";
        model_internal::propertyTypeMap["address"] = "Object";
        model_internal::propertyTypeMap["telephoneNumber"] = "Object";
        model_internal::propertyTypeMap["receptionDays"] = "Object";

        model_internal::_instance = value;
        model_internal::_idValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForId);
        model_internal::_idValidator.required = true;
        model_internal::_idValidator.requiredFieldError = "id is required";
        //model_internal::_idValidator.source = model_internal::_instance;
        //model_internal::_idValidator.property = "id";
        model_internal::_cityValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForCity);
        model_internal::_cityValidator.required = true;
        model_internal::_cityValidator.requiredFieldError = "city is required";
        //model_internal::_cityValidator.source = model_internal::_instance;
        //model_internal::_cityValidator.property = "city";
        model_internal::_addressValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForAddress);
        model_internal::_addressValidator.required = true;
        model_internal::_addressValidator.requiredFieldError = "address is required";
        //model_internal::_addressValidator.source = model_internal::_instance;
        //model_internal::_addressValidator.property = "address";
        model_internal::_telephoneNumberValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTelephoneNumber);
        model_internal::_telephoneNumberValidator.required = true;
        model_internal::_telephoneNumberValidator.requiredFieldError = "telephoneNumber is required";
        //model_internal::_telephoneNumberValidator.source = model_internal::_instance;
        //model_internal::_telephoneNumberValidator.property = "telephoneNumber";
        model_internal::_receptionDaysValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForReceptionDays);
        model_internal::_receptionDaysValidator.required = true;
        model_internal::_receptionDaysValidator.requiredFieldError = "receptionDays is required";
        //model_internal::_receptionDaysValidator.source = model_internal::_instance;
        //model_internal::_receptionDaysValidator.property = "receptionDays";
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
            throw new Error(propertyName + " is not a data property of entity Location");
            
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
            throw new Error(propertyName + " is not a collection property of entity Location");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Location");

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
            throw new Error(propertyName + " does not exist for entity Location");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Location");
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
            throw new Error(propertyName + " does not exist for entity Location");
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
    public function get isIdAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCityAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isAddressAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTelephoneNumberAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isReceptionDaysAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnId():void
    {
        if (model_internal::_idIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfId = null;
            model_internal::calculateIdIsValid();
        }
    }
    public function invalidateDependentOnCity():void
    {
        if (model_internal::_cityIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfCity = null;
            model_internal::calculateCityIsValid();
        }
    }
    public function invalidateDependentOnAddress():void
    {
        if (model_internal::_addressIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfAddress = null;
            model_internal::calculateAddressIsValid();
        }
    }
    public function invalidateDependentOnTelephoneNumber():void
    {
        if (model_internal::_telephoneNumberIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTelephoneNumber = null;
            model_internal::calculateTelephoneNumberIsValid();
        }
    }
    public function invalidateDependentOnReceptionDays():void
    {
        if (model_internal::_receptionDaysIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfReceptionDays = null;
            model_internal::calculateReceptionDaysIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get idValidator() : StyleValidator
    {
        return model_internal::_idValidator;
    }

    model_internal function set _idIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_idIsValid;         
        if (oldValue !== value)
        {
            model_internal::_idIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get idIsValid():Boolean
    {
        if (!model_internal::_idIsValidCacheInitialized)
        {
            model_internal::calculateIdIsValid();
        }

        return model_internal::_idIsValid;
    }

    model_internal function calculateIdIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_idValidator.validate(model_internal::_instance.id)
        model_internal::_idIsValid_der = (valRes.results == null);
        model_internal::_idIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::idValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::idValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get idValidationFailureMessages():Array
    {
        if (model_internal::_idValidationFailureMessages == null)
            model_internal::calculateIdIsValid();

        return _idValidationFailureMessages;
    }

    model_internal function set idValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_idValidationFailureMessages;

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
            model_internal::_idValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get cityStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get cityValidator() : StyleValidator
    {
        return model_internal::_cityValidator;
    }

    model_internal function set _cityIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_cityIsValid;         
        if (oldValue !== value)
        {
            model_internal::_cityIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cityIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get cityIsValid():Boolean
    {
        if (!model_internal::_cityIsValidCacheInitialized)
        {
            model_internal::calculateCityIsValid();
        }

        return model_internal::_cityIsValid;
    }

    model_internal function calculateCityIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_cityValidator.validate(model_internal::_instance.city)
        model_internal::_cityIsValid_der = (valRes.results == null);
        model_internal::_cityIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::cityValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::cityValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get cityValidationFailureMessages():Array
    {
        if (model_internal::_cityValidationFailureMessages == null)
            model_internal::calculateCityIsValid();

        return _cityValidationFailureMessages;
    }

    model_internal function set cityValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_cityValidationFailureMessages;

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
            model_internal::_cityValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cityValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get addressStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get addressValidator() : StyleValidator
    {
        return model_internal::_addressValidator;
    }

    model_internal function set _addressIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_addressIsValid;         
        if (oldValue !== value)
        {
            model_internal::_addressIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "addressIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get addressIsValid():Boolean
    {
        if (!model_internal::_addressIsValidCacheInitialized)
        {
            model_internal::calculateAddressIsValid();
        }

        return model_internal::_addressIsValid;
    }

    model_internal function calculateAddressIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_addressValidator.validate(model_internal::_instance.address)
        model_internal::_addressIsValid_der = (valRes.results == null);
        model_internal::_addressIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::addressValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::addressValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get addressValidationFailureMessages():Array
    {
        if (model_internal::_addressValidationFailureMessages == null)
            model_internal::calculateAddressIsValid();

        return _addressValidationFailureMessages;
    }

    model_internal function set addressValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_addressValidationFailureMessages;

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
            model_internal::_addressValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "addressValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get telephoneNumberStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get telephoneNumberValidator() : StyleValidator
    {
        return model_internal::_telephoneNumberValidator;
    }

    model_internal function set _telephoneNumberIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_telephoneNumberIsValid;         
        if (oldValue !== value)
        {
            model_internal::_telephoneNumberIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "telephoneNumberIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get telephoneNumberIsValid():Boolean
    {
        if (!model_internal::_telephoneNumberIsValidCacheInitialized)
        {
            model_internal::calculateTelephoneNumberIsValid();
        }

        return model_internal::_telephoneNumberIsValid;
    }

    model_internal function calculateTelephoneNumberIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_telephoneNumberValidator.validate(model_internal::_instance.telephoneNumber)
        model_internal::_telephoneNumberIsValid_der = (valRes.results == null);
        model_internal::_telephoneNumberIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::telephoneNumberValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::telephoneNumberValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get telephoneNumberValidationFailureMessages():Array
    {
        if (model_internal::_telephoneNumberValidationFailureMessages == null)
            model_internal::calculateTelephoneNumberIsValid();

        return _telephoneNumberValidationFailureMessages;
    }

    model_internal function set telephoneNumberValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_telephoneNumberValidationFailureMessages;

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
            model_internal::_telephoneNumberValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "telephoneNumberValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get receptionDaysStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get receptionDaysValidator() : StyleValidator
    {
        return model_internal::_receptionDaysValidator;
    }

    model_internal function set _receptionDaysIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_receptionDaysIsValid;         
        if (oldValue !== value)
        {
            model_internal::_receptionDaysIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "receptionDaysIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get receptionDaysIsValid():Boolean
    {
        if (!model_internal::_receptionDaysIsValidCacheInitialized)
        {
            model_internal::calculateReceptionDaysIsValid();
        }

        return model_internal::_receptionDaysIsValid;
    }

    model_internal function calculateReceptionDaysIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_receptionDaysValidator.validate(model_internal::_instance.receptionDays)
        model_internal::_receptionDaysIsValid_der = (valRes.results == null);
        model_internal::_receptionDaysIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::receptionDaysValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::receptionDaysValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get receptionDaysValidationFailureMessages():Array
    {
        if (model_internal::_receptionDaysValidationFailureMessages == null)
            model_internal::calculateReceptionDaysIsValid();

        return _receptionDaysValidationFailureMessages;
    }

    model_internal function set receptionDaysValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_receptionDaysValidationFailureMessages;

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
            model_internal::_receptionDaysValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "receptionDaysValidationFailureMessages", oldValue, value));
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
            case("id"):
            {
                return idValidationFailureMessages;
            }
            case("city"):
            {
                return cityValidationFailureMessages;
            }
            case("address"):
            {
                return addressValidationFailureMessages;
            }
            case("telephoneNumber"):
            {
                return telephoneNumberValidationFailureMessages;
            }
            case("receptionDays"):
            {
                return receptionDaysValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
