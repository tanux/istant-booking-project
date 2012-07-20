
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
internal class _BookingEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("id", "idAffiliate", "idManager", "idCustomer", "idLocation", "visitDay", "visitHour");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("id", "idAffiliate", "idManager", "idCustomer", "idLocation", "visitDay", "visitHour");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("id", "idAffiliate", "idManager", "idCustomer", "idLocation", "visitDay", "visitHour");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("id", "idAffiliate", "idManager", "idCustomer", "idLocation", "visitDay", "visitHour");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("id", "idAffiliate", "idManager", "idCustomer", "idLocation", "visitDay", "visitHour");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Booking";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _idIsValid:Boolean;
    model_internal var _idValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idIsValidCacheInitialized:Boolean = false;
    model_internal var _idValidationFailureMessages:Array;
    
    model_internal var _idAffiliateIsValid:Boolean;
    model_internal var _idAffiliateValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idAffiliateIsValidCacheInitialized:Boolean = false;
    model_internal var _idAffiliateValidationFailureMessages:Array;
    
    model_internal var _idManagerIsValid:Boolean;
    model_internal var _idManagerValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idManagerIsValidCacheInitialized:Boolean = false;
    model_internal var _idManagerValidationFailureMessages:Array;
    
    model_internal var _idCustomerIsValid:Boolean;
    model_internal var _idCustomerValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idCustomerIsValidCacheInitialized:Boolean = false;
    model_internal var _idCustomerValidationFailureMessages:Array;
    
    model_internal var _idLocationIsValid:Boolean;
    model_internal var _idLocationValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idLocationIsValidCacheInitialized:Boolean = false;
    model_internal var _idLocationValidationFailureMessages:Array;
    
    model_internal var _visitDayIsValid:Boolean;
    model_internal var _visitDayValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _visitDayIsValidCacheInitialized:Boolean = false;
    model_internal var _visitDayValidationFailureMessages:Array;
    
    model_internal var _visitHourIsValid:Boolean;
    model_internal var _visitHourValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _visitHourIsValidCacheInitialized:Boolean = false;
    model_internal var _visitHourValidationFailureMessages:Array;

    model_internal var _instance:_Super_Booking;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _BookingEntityMetadata(value : _Super_Booking)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["id"] = new Array();
            model_internal::dependentsOnMap["idAffiliate"] = new Array();
            model_internal::dependentsOnMap["idManager"] = new Array();
            model_internal::dependentsOnMap["idCustomer"] = new Array();
            model_internal::dependentsOnMap["idLocation"] = new Array();
            model_internal::dependentsOnMap["visitDay"] = new Array();
            model_internal::dependentsOnMap["visitHour"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["id"] = "Object";
        model_internal::propertyTypeMap["idAffiliate"] = "Object";
        model_internal::propertyTypeMap["idManager"] = "Object";
        model_internal::propertyTypeMap["idCustomer"] = "Object";
        model_internal::propertyTypeMap["idLocation"] = "Object";
        model_internal::propertyTypeMap["visitDay"] = "Object";
        model_internal::propertyTypeMap["visitHour"] = "Object";

        model_internal::_instance = value;
        model_internal::_idValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForId);
        model_internal::_idValidator.required = true;
        model_internal::_idValidator.requiredFieldError = "id is required";
        //model_internal::_idValidator.source = model_internal::_instance;
        //model_internal::_idValidator.property = "id";
        model_internal::_idAffiliateValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIdAffiliate);
        model_internal::_idAffiliateValidator.required = true;
        model_internal::_idAffiliateValidator.requiredFieldError = "idAffiliate is required";
        //model_internal::_idAffiliateValidator.source = model_internal::_instance;
        //model_internal::_idAffiliateValidator.property = "idAffiliate";
        model_internal::_idManagerValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIdManager);
        model_internal::_idManagerValidator.required = true;
        model_internal::_idManagerValidator.requiredFieldError = "idManager is required";
        //model_internal::_idManagerValidator.source = model_internal::_instance;
        //model_internal::_idManagerValidator.property = "idManager";
        model_internal::_idCustomerValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIdCustomer);
        model_internal::_idCustomerValidator.required = true;
        model_internal::_idCustomerValidator.requiredFieldError = "idCustomer is required";
        //model_internal::_idCustomerValidator.source = model_internal::_instance;
        //model_internal::_idCustomerValidator.property = "idCustomer";
        model_internal::_idLocationValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForIdLocation);
        model_internal::_idLocationValidator.required = true;
        model_internal::_idLocationValidator.requiredFieldError = "idLocation is required";
        //model_internal::_idLocationValidator.source = model_internal::_instance;
        //model_internal::_idLocationValidator.property = "idLocation";
        model_internal::_visitDayValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForVisitDay);
        model_internal::_visitDayValidator.required = true;
        model_internal::_visitDayValidator.requiredFieldError = "visitDay is required";
        //model_internal::_visitDayValidator.source = model_internal::_instance;
        //model_internal::_visitDayValidator.property = "visitDay";
        model_internal::_visitHourValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForVisitHour);
        model_internal::_visitHourValidator.required = true;
        model_internal::_visitHourValidator.requiredFieldError = "visitHour is required";
        //model_internal::_visitHourValidator.source = model_internal::_instance;
        //model_internal::_visitHourValidator.property = "visitHour";
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
            throw new Error(propertyName + " is not a data property of entity Booking");
            
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
            throw new Error(propertyName + " is not a collection property of entity Booking");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Booking");

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
            throw new Error(propertyName + " does not exist for entity Booking");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Booking");
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
            throw new Error(propertyName + " does not exist for entity Booking");
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
    public function get isIdAffiliateAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIdManagerAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIdCustomerAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isIdLocationAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isVisitDayAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isVisitHourAvailable():Boolean
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
    public function invalidateDependentOnIdAffiliate():void
    {
        if (model_internal::_idAffiliateIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIdAffiliate = null;
            model_internal::calculateIdAffiliateIsValid();
        }
    }
    public function invalidateDependentOnIdManager():void
    {
        if (model_internal::_idManagerIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIdManager = null;
            model_internal::calculateIdManagerIsValid();
        }
    }
    public function invalidateDependentOnIdCustomer():void
    {
        if (model_internal::_idCustomerIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIdCustomer = null;
            model_internal::calculateIdCustomerIsValid();
        }
    }
    public function invalidateDependentOnIdLocation():void
    {
        if (model_internal::_idLocationIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfIdLocation = null;
            model_internal::calculateIdLocationIsValid();
        }
    }
    public function invalidateDependentOnVisitDay():void
    {
        if (model_internal::_visitDayIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfVisitDay = null;
            model_internal::calculateVisitDayIsValid();
        }
    }
    public function invalidateDependentOnVisitHour():void
    {
        if (model_internal::_visitHourIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfVisitHour = null;
            model_internal::calculateVisitHourIsValid();
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
    public function get idAffiliateStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get idAffiliateValidator() : StyleValidator
    {
        return model_internal::_idAffiliateValidator;
    }

    model_internal function set _idAffiliateIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_idAffiliateIsValid;         
        if (oldValue !== value)
        {
            model_internal::_idAffiliateIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idAffiliateIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get idAffiliateIsValid():Boolean
    {
        if (!model_internal::_idAffiliateIsValidCacheInitialized)
        {
            model_internal::calculateIdAffiliateIsValid();
        }

        return model_internal::_idAffiliateIsValid;
    }

    model_internal function calculateIdAffiliateIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_idAffiliateValidator.validate(model_internal::_instance.idAffiliate)
        model_internal::_idAffiliateIsValid_der = (valRes.results == null);
        model_internal::_idAffiliateIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::idAffiliateValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::idAffiliateValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get idAffiliateValidationFailureMessages():Array
    {
        if (model_internal::_idAffiliateValidationFailureMessages == null)
            model_internal::calculateIdAffiliateIsValid();

        return _idAffiliateValidationFailureMessages;
    }

    model_internal function set idAffiliateValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_idAffiliateValidationFailureMessages;

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
            model_internal::_idAffiliateValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idAffiliateValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get idManagerStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get idManagerValidator() : StyleValidator
    {
        return model_internal::_idManagerValidator;
    }

    model_internal function set _idManagerIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_idManagerIsValid;         
        if (oldValue !== value)
        {
            model_internal::_idManagerIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idManagerIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get idManagerIsValid():Boolean
    {
        if (!model_internal::_idManagerIsValidCacheInitialized)
        {
            model_internal::calculateIdManagerIsValid();
        }

        return model_internal::_idManagerIsValid;
    }

    model_internal function calculateIdManagerIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_idManagerValidator.validate(model_internal::_instance.idManager)
        model_internal::_idManagerIsValid_der = (valRes.results == null);
        model_internal::_idManagerIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::idManagerValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::idManagerValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get idManagerValidationFailureMessages():Array
    {
        if (model_internal::_idManagerValidationFailureMessages == null)
            model_internal::calculateIdManagerIsValid();

        return _idManagerValidationFailureMessages;
    }

    model_internal function set idManagerValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_idManagerValidationFailureMessages;

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
            model_internal::_idManagerValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idManagerValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get idCustomerStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get idCustomerValidator() : StyleValidator
    {
        return model_internal::_idCustomerValidator;
    }

    model_internal function set _idCustomerIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_idCustomerIsValid;         
        if (oldValue !== value)
        {
            model_internal::_idCustomerIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idCustomerIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get idCustomerIsValid():Boolean
    {
        if (!model_internal::_idCustomerIsValidCacheInitialized)
        {
            model_internal::calculateIdCustomerIsValid();
        }

        return model_internal::_idCustomerIsValid;
    }

    model_internal function calculateIdCustomerIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_idCustomerValidator.validate(model_internal::_instance.idCustomer)
        model_internal::_idCustomerIsValid_der = (valRes.results == null);
        model_internal::_idCustomerIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::idCustomerValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::idCustomerValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get idCustomerValidationFailureMessages():Array
    {
        if (model_internal::_idCustomerValidationFailureMessages == null)
            model_internal::calculateIdCustomerIsValid();

        return _idCustomerValidationFailureMessages;
    }

    model_internal function set idCustomerValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_idCustomerValidationFailureMessages;

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
            model_internal::_idCustomerValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idCustomerValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get idLocationStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get idLocationValidator() : StyleValidator
    {
        return model_internal::_idLocationValidator;
    }

    model_internal function set _idLocationIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_idLocationIsValid;         
        if (oldValue !== value)
        {
            model_internal::_idLocationIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idLocationIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get idLocationIsValid():Boolean
    {
        if (!model_internal::_idLocationIsValidCacheInitialized)
        {
            model_internal::calculateIdLocationIsValid();
        }

        return model_internal::_idLocationIsValid;
    }

    model_internal function calculateIdLocationIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_idLocationValidator.validate(model_internal::_instance.idLocation)
        model_internal::_idLocationIsValid_der = (valRes.results == null);
        model_internal::_idLocationIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::idLocationValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::idLocationValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get idLocationValidationFailureMessages():Array
    {
        if (model_internal::_idLocationValidationFailureMessages == null)
            model_internal::calculateIdLocationIsValid();

        return _idLocationValidationFailureMessages;
    }

    model_internal function set idLocationValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_idLocationValidationFailureMessages;

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
            model_internal::_idLocationValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "idLocationValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get visitDayStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get visitDayValidator() : StyleValidator
    {
        return model_internal::_visitDayValidator;
    }

    model_internal function set _visitDayIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_visitDayIsValid;         
        if (oldValue !== value)
        {
            model_internal::_visitDayIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitDayIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get visitDayIsValid():Boolean
    {
        if (!model_internal::_visitDayIsValidCacheInitialized)
        {
            model_internal::calculateVisitDayIsValid();
        }

        return model_internal::_visitDayIsValid;
    }

    model_internal function calculateVisitDayIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_visitDayValidator.validate(model_internal::_instance.visitDay)
        model_internal::_visitDayIsValid_der = (valRes.results == null);
        model_internal::_visitDayIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::visitDayValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::visitDayValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get visitDayValidationFailureMessages():Array
    {
        if (model_internal::_visitDayValidationFailureMessages == null)
            model_internal::calculateVisitDayIsValid();

        return _visitDayValidationFailureMessages;
    }

    model_internal function set visitDayValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_visitDayValidationFailureMessages;

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
            model_internal::_visitDayValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitDayValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get visitHourStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get visitHourValidator() : StyleValidator
    {
        return model_internal::_visitHourValidator;
    }

    model_internal function set _visitHourIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_visitHourIsValid;         
        if (oldValue !== value)
        {
            model_internal::_visitHourIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitHourIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get visitHourIsValid():Boolean
    {
        if (!model_internal::_visitHourIsValidCacheInitialized)
        {
            model_internal::calculateVisitHourIsValid();
        }

        return model_internal::_visitHourIsValid;
    }

    model_internal function calculateVisitHourIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_visitHourValidator.validate(model_internal::_instance.visitHour)
        model_internal::_visitHourIsValid_der = (valRes.results == null);
        model_internal::_visitHourIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::visitHourValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::visitHourValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get visitHourValidationFailureMessages():Array
    {
        if (model_internal::_visitHourValidationFailureMessages == null)
            model_internal::calculateVisitHourIsValid();

        return _visitHourValidationFailureMessages;
    }

    model_internal function set visitHourValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_visitHourValidationFailureMessages;

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
            model_internal::_visitHourValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "visitHourValidationFailureMessages", oldValue, value));
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
            case("idAffiliate"):
            {
                return idAffiliateValidationFailureMessages;
            }
            case("idManager"):
            {
                return idManagerValidationFailureMessages;
            }
            case("idCustomer"):
            {
                return idCustomerValidationFailureMessages;
            }
            case("idLocation"):
            {
                return idLocationValidationFailureMessages;
            }
            case("visitDay"):
            {
                return visitDayValidationFailureMessages;
            }
            case("visitHour"):
            {
                return visitHourValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
