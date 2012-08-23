
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
internal class _ManagerEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("id", "firstname", "lastname", "username", "password");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("id", "firstname", "lastname", "username", "password");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("id", "firstname", "lastname", "username", "password");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("id", "firstname", "lastname", "username", "password");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("id", "firstname", "lastname", "username", "password");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Manager";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _idIsValid:Boolean;
    model_internal var _idValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _idIsValidCacheInitialized:Boolean = false;
    model_internal var _idValidationFailureMessages:Array;
    
    model_internal var _firstnameIsValid:Boolean;
    model_internal var _firstnameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _firstnameIsValidCacheInitialized:Boolean = false;
    model_internal var _firstnameValidationFailureMessages:Array;
    
    model_internal var _lastnameIsValid:Boolean;
    model_internal var _lastnameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _lastnameIsValidCacheInitialized:Boolean = false;
    model_internal var _lastnameValidationFailureMessages:Array;
    
    model_internal var _usernameIsValid:Boolean;
    model_internal var _usernameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _usernameIsValidCacheInitialized:Boolean = false;
    model_internal var _usernameValidationFailureMessages:Array;
    
    model_internal var _passwordIsValid:Boolean;
    model_internal var _passwordValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _passwordIsValidCacheInitialized:Boolean = false;
    model_internal var _passwordValidationFailureMessages:Array;

    model_internal var _instance:_Super_Manager;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _ManagerEntityMetadata(value : _Super_Manager)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["id"] = new Array();
            model_internal::dependentsOnMap["firstname"] = new Array();
            model_internal::dependentsOnMap["lastname"] = new Array();
            model_internal::dependentsOnMap["username"] = new Array();
            model_internal::dependentsOnMap["password"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["id"] = "Object";
        model_internal::propertyTypeMap["firstname"] = "Object";
        model_internal::propertyTypeMap["lastname"] = "Object";
        model_internal::propertyTypeMap["username"] = "Object";
        model_internal::propertyTypeMap["password"] = "Object";

        model_internal::_instance = value;
        model_internal::_idValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForId);
        model_internal::_idValidator.required = true;
        model_internal::_idValidator.requiredFieldError = "id is required";
        //model_internal::_idValidator.source = model_internal::_instance;
        //model_internal::_idValidator.property = "id";
        model_internal::_firstnameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForFirstname);
        model_internal::_firstnameValidator.required = true;
        model_internal::_firstnameValidator.requiredFieldError = "firstname is required";
        //model_internal::_firstnameValidator.source = model_internal::_instance;
        //model_internal::_firstnameValidator.property = "firstname";
        model_internal::_lastnameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLastname);
        model_internal::_lastnameValidator.required = true;
        model_internal::_lastnameValidator.requiredFieldError = "lastname is required";
        //model_internal::_lastnameValidator.source = model_internal::_instance;
        //model_internal::_lastnameValidator.property = "lastname";
        model_internal::_usernameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForUsername);
        model_internal::_usernameValidator.required = true;
        model_internal::_usernameValidator.requiredFieldError = "username is required";
        //model_internal::_usernameValidator.source = model_internal::_instance;
        //model_internal::_usernameValidator.property = "username";
        model_internal::_passwordValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForPassword);
        model_internal::_passwordValidator.required = true;
        model_internal::_passwordValidator.requiredFieldError = "password is required";
        //model_internal::_passwordValidator.source = model_internal::_instance;
        //model_internal::_passwordValidator.property = "password";
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
            throw new Error(propertyName + " is not a data property of entity Manager");
            
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
            throw new Error(propertyName + " is not a collection property of entity Manager");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Manager");

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
            throw new Error(propertyName + " does not exist for entity Manager");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Manager");
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
            throw new Error(propertyName + " does not exist for entity Manager");
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
    public function get isFirstnameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLastnameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isUsernameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPasswordAvailable():Boolean
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
    public function invalidateDependentOnFirstname():void
    {
        if (model_internal::_firstnameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfFirstname = null;
            model_internal::calculateFirstnameIsValid();
        }
    }
    public function invalidateDependentOnLastname():void
    {
        if (model_internal::_lastnameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLastname = null;
            model_internal::calculateLastnameIsValid();
        }
    }
    public function invalidateDependentOnUsername():void
    {
        if (model_internal::_usernameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfUsername = null;
            model_internal::calculateUsernameIsValid();
        }
    }
    public function invalidateDependentOnPassword():void
    {
        if (model_internal::_passwordIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfPassword = null;
            model_internal::calculatePasswordIsValid();
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
    public function get firstnameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get firstnameValidator() : StyleValidator
    {
        return model_internal::_firstnameValidator;
    }

    model_internal function set _firstnameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_firstnameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_firstnameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstnameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get firstnameIsValid():Boolean
    {
        if (!model_internal::_firstnameIsValidCacheInitialized)
        {
            model_internal::calculateFirstnameIsValid();
        }

        return model_internal::_firstnameIsValid;
    }

    model_internal function calculateFirstnameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_firstnameValidator.validate(model_internal::_instance.firstname)
        model_internal::_firstnameIsValid_der = (valRes.results == null);
        model_internal::_firstnameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::firstnameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::firstnameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get firstnameValidationFailureMessages():Array
    {
        if (model_internal::_firstnameValidationFailureMessages == null)
            model_internal::calculateFirstnameIsValid();

        return _firstnameValidationFailureMessages;
    }

    model_internal function set firstnameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_firstnameValidationFailureMessages;

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
            model_internal::_firstnameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "firstnameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get lastnameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get lastnameValidator() : StyleValidator
    {
        return model_internal::_lastnameValidator;
    }

    model_internal function set _lastnameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_lastnameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_lastnameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastnameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get lastnameIsValid():Boolean
    {
        if (!model_internal::_lastnameIsValidCacheInitialized)
        {
            model_internal::calculateLastnameIsValid();
        }

        return model_internal::_lastnameIsValid;
    }

    model_internal function calculateLastnameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_lastnameValidator.validate(model_internal::_instance.lastname)
        model_internal::_lastnameIsValid_der = (valRes.results == null);
        model_internal::_lastnameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::lastnameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::lastnameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get lastnameValidationFailureMessages():Array
    {
        if (model_internal::_lastnameValidationFailureMessages == null)
            model_internal::calculateLastnameIsValid();

        return _lastnameValidationFailureMessages;
    }

    model_internal function set lastnameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_lastnameValidationFailureMessages;

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
            model_internal::_lastnameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lastnameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get usernameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get usernameValidator() : StyleValidator
    {
        return model_internal::_usernameValidator;
    }

    model_internal function set _usernameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_usernameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_usernameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "usernameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get usernameIsValid():Boolean
    {
        if (!model_internal::_usernameIsValidCacheInitialized)
        {
            model_internal::calculateUsernameIsValid();
        }

        return model_internal::_usernameIsValid;
    }

    model_internal function calculateUsernameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_usernameValidator.validate(model_internal::_instance.username)
        model_internal::_usernameIsValid_der = (valRes.results == null);
        model_internal::_usernameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::usernameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::usernameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get usernameValidationFailureMessages():Array
    {
        if (model_internal::_usernameValidationFailureMessages == null)
            model_internal::calculateUsernameIsValid();

        return _usernameValidationFailureMessages;
    }

    model_internal function set usernameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_usernameValidationFailureMessages;

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
            model_internal::_usernameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "usernameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get passwordStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get passwordValidator() : StyleValidator
    {
        return model_internal::_passwordValidator;
    }

    model_internal function set _passwordIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_passwordIsValid;         
        if (oldValue !== value)
        {
            model_internal::_passwordIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "passwordIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get passwordIsValid():Boolean
    {
        if (!model_internal::_passwordIsValidCacheInitialized)
        {
            model_internal::calculatePasswordIsValid();
        }

        return model_internal::_passwordIsValid;
    }

    model_internal function calculatePasswordIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_passwordValidator.validate(model_internal::_instance.password)
        model_internal::_passwordIsValid_der = (valRes.results == null);
        model_internal::_passwordIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::passwordValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::passwordValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get passwordValidationFailureMessages():Array
    {
        if (model_internal::_passwordValidationFailureMessages == null)
            model_internal::calculatePasswordIsValid();

        return _passwordValidationFailureMessages;
    }

    model_internal function set passwordValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_passwordValidationFailureMessages;

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
            model_internal::_passwordValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "passwordValidationFailureMessages", oldValue, value));
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
            case("firstname"):
            {
                return firstnameValidationFailureMessages;
            }
            case("lastname"):
            {
                return lastnameValidationFailureMessages;
            }
            case("username"):
            {
                return usernameValidationFailureMessages;
            }
            case("password"):
            {
                return passwordValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
