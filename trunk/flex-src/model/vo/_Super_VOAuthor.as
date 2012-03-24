/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - VOAuthor.as.
 */

package model.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_VOAuthor extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
        try
        {
            if (flash.net.getClassByAlias("VOAuthor") == null)
            {
                flash.net.registerClassAlias("VOAuthor", cz);
            }
        }
        catch (e:Error)
        {
            flash.net.registerClassAlias("VOAuthor", cz);
        }
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _VOAuthorEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_lname_aut : String;
    private var _internal_fname_aut : String;
    private var _internal_id_aut : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_VOAuthor()
    {
        _model = new _VOAuthorEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "lname_aut", model_internal::setterListenerLname_aut));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "fname_aut", model_internal::setterListenerFname_aut));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "id_aut", model_internal::setterListenerId_aut));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get lname_aut() : String
    {
        return _internal_lname_aut;
    }

    [Bindable(event="propertyChange")]
    public function get fname_aut() : String
    {
        return _internal_fname_aut;
    }

    [Bindable(event="propertyChange")]
    public function get id_aut() : String
    {
        return _internal_id_aut;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set lname_aut(value:String) : void
    {
        var oldValue:String = _internal_lname_aut;
        if (oldValue !== value)
        {
            _internal_lname_aut = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "lname_aut", oldValue, _internal_lname_aut));
        }
    }

    public function set fname_aut(value:String) : void
    {
        var oldValue:String = _internal_fname_aut;
        if (oldValue !== value)
        {
            _internal_fname_aut = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "fname_aut", oldValue, _internal_fname_aut));
        }
    }

    public function set id_aut(value:String) : void
    {
        var oldValue:String = _internal_id_aut;
        if (oldValue !== value)
        {
            _internal_id_aut = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "id_aut", oldValue, _internal_id_aut));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerLname_aut(value:flash.events.Event):void
    {
        _model.invalidateDependentOnLname_aut();
    }

    model_internal function setterListenerFname_aut(value:flash.events.Event):void
    {
        _model.invalidateDependentOnFname_aut();
    }

    model_internal function setterListenerId_aut(value:flash.events.Event):void
    {
        _model.invalidateDependentOnId_aut();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.lname_autIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_lname_autValidationFailureMessages);
        }
        if (!_model.fname_autIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_fname_autValidationFailureMessages);
        }
        if (!_model.id_autIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_id_autValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _VOAuthorEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _VOAuthorEntityMetadata) : void
    {
        var oldValue : _VOAuthorEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfLname_aut : Array = null;
    model_internal var _doValidationLastValOfLname_aut : String;

    model_internal function _doValidationForLname_aut(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfLname_aut != null && model_internal::_doValidationLastValOfLname_aut == value)
           return model_internal::_doValidationCacheOfLname_aut ;

        _model.model_internal::_lname_autIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLname_autAvailable && _internal_lname_aut == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "lname_aut is required"));
        }

        model_internal::_doValidationCacheOfLname_aut = validationFailures;
        model_internal::_doValidationLastValOfLname_aut = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfFname_aut : Array = null;
    model_internal var _doValidationLastValOfFname_aut : String;

    model_internal function _doValidationForFname_aut(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfFname_aut != null && model_internal::_doValidationLastValOfFname_aut == value)
           return model_internal::_doValidationCacheOfFname_aut ;

        _model.model_internal::_fname_autIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isFname_autAvailable && _internal_fname_aut == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "fname_aut is required"));
        }

        model_internal::_doValidationCacheOfFname_aut = validationFailures;
        model_internal::_doValidationLastValOfFname_aut = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfId_aut : Array = null;
    model_internal var _doValidationLastValOfId_aut : String;

    model_internal function _doValidationForId_aut(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfId_aut != null && model_internal::_doValidationLastValOfId_aut == value)
           return model_internal::_doValidationCacheOfId_aut ;

        _model.model_internal::_id_autIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isId_autAvailable && _internal_id_aut == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "id_aut is required"));
        }

        model_internal::_doValidationCacheOfId_aut = validationFailures;
        model_internal::_doValidationLastValOfId_aut = value;

        return validationFailures;
    }
    

}

}
